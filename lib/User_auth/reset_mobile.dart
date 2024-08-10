import 'dart:convert';
import 'package:edyon/User_auth/resetotppage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'otppage.dart'; // Import the OTP page
import 'signin_page.dart'; // Import the Sign-In page

class ResetOTP extends StatefulWidget {
  const ResetOTP({Key? key}) : super(key: key);

  @override
  _RegisterOTPState createState() => _RegisterOTPState();
}

class _RegisterOTPState extends State<ResetOTP> {
  final TextEditingController phoneController = TextEditingController();
  String? _errorMessage;
  bool _isLoading = false;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _sendOTP() async {
    setState(() {
      _errorMessage = null;
      _isLoading = true;
    });

    String phoneNumber = phoneController.text;

    if (phoneNumber.isEmpty || phoneNumber.length != 10) {
      setState(() {
        _errorMessage = 'Please enter a valid 10-digit mobile number.';
        _isLoading = false;
      });
      return;
    }

    final url = Uri.parse('https://admin.edyone.site/api/student/otp-send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'mobile': phoneNumber}),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200 && responseData['status']) {
      // Extract data from the response and store it in SharedPreferences
      String token = responseData['token'];
      // int id = responseData['data']['id'];
      // String mobile = responseData['data']['mobile'];
      // bool status = responseData['status'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      // await prefs.setInt('id', id);
      // await prefs.setString('mobile', mobile);
      // await prefs.setBool('status', status);

      // Navigate to the OTP page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => REnterOTPPage(token: token)),
      );
    } else {
      setState(() {
        _errorMessage =
            responseData['message'] ?? 'Failed to send OTP. Please try again.';
      });
    }
  }

  // Future<void> _sendOTP() async {
  //   setState(() {
  //     _errorMessage = null;
  //     _isLoading = true;
  //   });
  //
  //   String phoneNumber = phoneController.text;
  //
  //   if (phoneNumber.isEmpty || phoneNumber.length != 10) {
  //     setState(() {
  //       _errorMessage = 'Please enter a valid 10-digit mobile number.';
  //       _isLoading = false;
  //     });
  //     return;
  //   }
  //   final url = Uri.parse('https://admin.edyone.site/api/student/otp-send');
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode({'mobile': phoneNumber}),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final responseBody = jsonDecode(response.body);
  //     final token = responseBody['token'];
  //
  //     // Store token in SharedPreferences
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('token', token);
  //
  //     // Navigate to OTP page
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => EnterOTPPage(token: token),
  //       ),
  //     );
  //   } else {
  //     // Handle error
  //     print('Failed to send OTP');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 80.0, 30.0, 30.0),
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
            const SizedBox(height: 20),
            const Text(
              'Enter Your Mobile Number',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/flag.png',
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Center(
                      child: Text(
                        '+91',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Center(
                    child: Text(
                      '|',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Enter Mobile Number',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
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
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _sendOTP,
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(15.0)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      foregroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.black54;
                        }
                        return Colors.white;
                      }),
                    ),
                    child: _isLoading
                        ? const Center(
                            // child: CircularProgressIndicator(
                            //   color: Colors.blue,
                            // ),
                            )
                        : const Text(
                            'Send OTP',
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF0000FF),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
