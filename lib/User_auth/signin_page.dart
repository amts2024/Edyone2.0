import 'dart:convert';
import 'package:edyon/User_auth/reset_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'forgotPasswordNumber.dart';
import 'register_mobile.dart';
import '../Navbar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _phoneNumberError;
  String? _passwordError;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Navbar()),
      );
    }
  }

  void _signIn() async {
    setState(() {
      _phoneNumberError = null;
      _passwordError = null;
    });

    if (_phoneNumberController.text.isEmpty) {
      setState(() {
        _phoneNumberError = 'Please enter your mobile number';
      });
      return;
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _passwordError = 'Please enter your password';
      });
      return;
    }

    await _signInToServer(
        _phoneNumberController.text, _passwordController.text);
  }

  Future<void> _signInToServer(String phoneNumber, String password) async {
    String apiUrl = 'https://admin.edyone.site/api/student/login';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, String> data = {
      'mobile': phoneNumber,
      'password': password,
    };

    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        String token = responseBody['token'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Navbar()),
        );
      } else {
        var responseBody = jsonDecode(response.body);
        String message = responseBody['message'] ?? 'Failed to sign in';

        setState(() {
          if (message.contains('not registered')) {
            _phoneNumberError = 'The mobile number is not registered';
          } else if (message.contains('invalid password')) {
            _passwordError = 'Password is not valid';
          } else if (message.contains('invalid mobile')) {
            _phoneNumberError = 'Mobile number is not valid';
          } else {
            _phoneNumberError = 'Failed to sign in: $message';
          }
        });
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        _phoneNumberError = 'Please try after some time';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Login to continue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/flag.png',
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ),
                        Container(
                          child: const Row(
                            children: [
                              Padding(
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
                              SizedBox(width: 8),
                              Center(
                                child: Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                hintText: 'Enter Mobile Number',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (_phoneNumberError != null)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 0),
                  child: Text(
                    _phoneNumberError!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          errorText: _passwordError,
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            child: Icon(
                              _passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (_phoneNumberError != null || _passwordError != null)
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'password required',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPass(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
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
                    height: 60,
                    child: ElevatedButton(
                      onPressed: _signIn,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(15.0)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        foregroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.black54;
                          }
                          return Colors.white;
                        }),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Or "),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterOTP(),
                        ),
                      );
                    },
                    child: const Text(
                      'Register',
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
      ),
    );
  }
}
