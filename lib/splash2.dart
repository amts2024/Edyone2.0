import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';
import 'register_mobile.dart';
import 'otppage.dart';
import 'signin_page.dart'; // Import the SignInPage
import 'registration.dart'; // Import the Registration page

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  final PageController _pageController = PageController();
  late Timer _timer;
  bool _isTimerActive = true; // Track if auto-scroll timer is active

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_isTimerActive) {
        int nextPage = (_pageController.page ?? 0).round() + 1;
        if (nextPage == 3) {
          nextPage = 0; // Loop back to the first page
        }
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              RegisterOTP()), // Navigate to RegisterOTP or another screen
    );
  }

  void _toggleTimer() {
    setState(() {
      _isTimerActive = !_isTimerActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleTimer,
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                // No additional action needed on page change
              },
              children: [
                SplashScreenContent(
                  imagePath: 'images/logo.png',
                  title: 'Better way of learning is calling you',
                  description:
                      'Learn from the best teachers of India in a simple and easy way',
                ),
                SplashScreenContent(
                  imagePath: 'images/logo2.png',
                  title: 'Find yourself by learning whatever you learn',
                  description:
                      'Learn whatever you want to learn with the best content at an affordable price by looking for courses and batches.',
                ),
                SplashScreenContent(
                  imagePath: 'images/logo3.png',
                  title: 'It’s not just learning, It’s a promise!',
                  description:
                      'We will deliver our best to make you the best and it\'s our promise.',
                ),
              ],
            ),
            Positioned(
              bottom: 180,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: CustomizableEffect(
                    activeDotDecoration: DotDecoration(
                      width: 10,
                      height: 10,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(6),
                      dotBorder: DotBorder(
                        color: Color(0xFF1A21BC),
                        width: 5,
                      ),
                    ),
                    dotDecoration: DotDecoration(
                      width: 8,
                      height: 8,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    spacing: 16.0,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: _skip,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 5),
                    Image.asset(
                      'images/skip.png', // Ensure this asset is available
                      width: 45,
                      height: 22,
                    ),
                    SizedBox(width: 10),
                    Text('Skip',
                        style: TextStyle(
                            color: Colors
                                .white)), // Optional: Add text for clarity
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    width: 335,
                    height: 60,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                        stops: [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RegisterOTP()), // Navigate to RegisterOTP screen
                        );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(10.0)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.transparent), // Transparent background
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white), // White text color
                      ),
                      child: Text('Register',
                          style:
                              TextStyle(fontSize: 16, fontFamily: 'Poppins')),
                    ),
                  ),
                  Container(
                    width: 335, // Set the width
                    height: 60, // Set the height
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(6.0), // Set the radius
                      border: Border.all(
                          color: Color(0xFFCFD1D4),
                          width: 1), // Set the border color and width
                      color: Colors.white, // Set the background color
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SignInPage(), // Navigate to SignInPage screen
                          ),
                        );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(
                              0), // Adjust padding to ensure the button size is accurate
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                6.0), // Ensure radius matches the decoration
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white), // Background color
                        foregroundColor: MaterialStateProperty.all(Colors
                            .transparent), // Text color will be set by ShaderMask
                      ),
                      child: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                          stops: [0.0, 1.0],
                        ).createShader(bounds),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            color: Colors.white, // Text color set by ShaderMask
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreenContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  SplashScreenContent({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 219,
              height: 185,
            ),
            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9FA3A9), // Updated font color
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
