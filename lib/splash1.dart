import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'Navbar.dart';
import 'splash2.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SplashScreens()), // Replace with your next screen
      );
    });

    _checkToken();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.png'), // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Centered ImageView (id: imageView)
            Center(
              child: Image.asset(
                'images/dd.png', // Make sure the image is in the assets folder
                width: 190.83,
                height: 155.31,
              ),
            ),
            // Centered Column for the TextViews and ImageViews at the bottom
            Align(
              alignment: Alignment(0, 0.942),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Made with',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          color: Color(0xFF919191),
                        ),
                      ),
                      SizedBox(width: 10), // Space between the text and images
                      Image.asset(
                        'images/red.png', // Ensure this asset is available
                        width: 21,
                        height: 21,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'in',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          color: Color(0xFF919191),
                        ),
                      ),
                      SizedBox(width: 10),
                      Image.asset(
                        'images/flag.png', // Ensure this asset is available
                        width: 21,
                        height: 21,
                      ),
                    ],
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
