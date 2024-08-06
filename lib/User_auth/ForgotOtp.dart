import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'ForgotNewPass.dart';
import 'Reset_pwd.dart';
import 'create_password.dart';

class ForgotpassOTP extends StatefulWidget {
  final String token;

  const ForgotpassOTP({Key? key, required this.token}) : super(key: key);

  @override
  _EnterOTPPageState createState() => _EnterOTPPageState();
}

class _EnterOTPPageState extends State<ForgotpassOTP> {
  final List<TextEditingController> _otpControllers =
  List.generate(6, (index) => TextEditingController());
  String? _errorMessage;
  late Timer _timer;
  int _resendTimer = 60;

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    _timer.cancel();
    super.dispose();
  }

  void startResendTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_resendTimer == 0) {
          timer.cancel();
        } else {
          _resendTimer--;
        }
      });
    });
  }

  void resetResendTimer() {
    setState(() {
      _resendTimer = 60;
      startResendTimer();
    });
  }

  void _verifyOTP() async {
    String otp = _otpControllers.map((controller) => controller.text).join();

    if (otp.length != 6) {
      setState(() {
        _errorMessage = 'Please enter a valid 6-digit OTP';
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
      await _sendOtpToServer(otp);
    }
  }

  Future<void> _sendOtpToServer(String otp) async {
    String apiUrl = 'https://admin.edyone.site/api/student/verify-otp';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${widget.token}',
    };

    Map<String, String> data = {
      'otp': otp,
    };

    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Save the token in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', widget.token);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotNewPass()),
        );
      } else {
        setState(() {
          _errorMessage = 'Failed to verify OTP';
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'An error occurred. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_sharp),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Enter OTP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: List.generate(
                6,
                    (index) => Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: TextField(
                    controller: _otpControllers[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                      counter: SizedBox.shrink(),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < 5) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).unfocus();
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$_resendTimer seconds left'),
                  if (_resendTimer == 0)
                    GestureDetector(
                      onTap: () {
                        resetResendTimer();
                        // Handle resend OTP
                      },
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  else
                    Text('Resend OTP'), // Display countdown
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.pink],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ElevatedButton(
                  onPressed: _verifyOTP,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(15.0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.transparent;
                    }),
                    foregroundColor:
                    MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.black54;
                      }
                      return Colors.white;
                    }),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PhoneNumberPage(),
//     );
//   }
// }
//
// class PhoneNumberPage extends StatefulWidget {
//   @override
//   _PhoneNumberPageState createState() => _PhoneNumberPageState();
// }
//
// class _PhoneNumberPageState extends State<PhoneNumberPage> {
//   final _phoneNumberController = TextEditingController();
//
//   Future<void> _sendOtp() async {
//     final String phoneNumber = _phoneNumberController.text;
//     final url = Uri.parse('https://admin.edyone.site/api/student/otp-send');
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({'mobile': phoneNumber}),
//     );
//
//     if (response.statusCode == 200) {
//       final responseBody = jsonDecode(response.body);
//       final token = responseBody['token'];
//
//       // Store token in SharedPreferences
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('token', token);
//
//       // Navigate to OTP page
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => OtpPage(),
//         ),
//       );
//     } else {
//       // Handle error
//       print('Failed to send OTP');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter Phone Number'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _phoneNumberController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 labelText: 'Phone Number',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _sendOtp,
//               child: Text('Send OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class OtpPage extends StatefulWidget {
//   @override
//   _OtpPageState createState() => _OtpPageState();
// }
//
// class _OtpPageState extends State<OtpPage> {
//   final _otpController = TextEditingController();
//
//   Future<void> _verifyOtp() async {
//     final String otp = _otpController.text;
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//
//     // Assuming you have an API endpoint to verify OTP
//     final url = Uri.parse('https://admin.edyone.site/api/student/verify-otp');
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: jsonEncode({'otp': otp}),
//     );
//
//     if (response.statusCode == 200) {
//       // OTP verified successfully
//       print('OTP verified');
//       // Navigate to next page
//     } else {
//       // Handle error
//       print('Failed to verify OTP');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter OTP'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'OTP',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _verifyOtp,
//               child: Text('Verify OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
