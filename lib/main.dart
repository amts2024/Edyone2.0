import 'package:edyon/Profile/MyProfile.dart';
import 'package:edyon/refer_and_earn.dart';
import 'package:edyon/splash1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'About_us.dart';
import 'Batches/Batch.dart';
import 'Batches/Custom_Batch.dart';
import 'Course/intructorDetails.dart';
import 'Instructor.dart';
import 'Instructor_deatails.dart';

import 'Course/courses.dart';
import 'FollowUs.dart';
import 'Learning&Center.dart';
import 'Navbar.dart';

import 'Notes.dart';
import 'Profile/More_Free.dart';
import 'Refer/Cart.dart';
import 'User_auth/signin_page.dart';
import 'new screen/Books_Screen.dart';
import 'new screen/Videos_Screen.dart'; // Import SignInPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Setting the status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFCFEF), // Your color here
      statusBarBrightness: Brightness.dark, // For iOS (light or dark)
      statusBarIconBrightness: Brightness.dark, // For Android (light or dark)
    ));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      initialRoute: '/',
      routes: {
        '/': (context) => Books(),
        '/login': (context) => MainPage(), // Add the CheckAuth route

        // Login screen
      },
    );
  }
}

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Center(
                  child:
                      CircularProgressIndicator())); // Show a loading spinner
        } else if (snapshot.hasData && snapshot.data == true) {
          return HomePage(); // Redirect to the HomePage if logged in
        } else {
          return MainPage(); // Redirect to the MainPage if not logged in
        }
      },
    );
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
