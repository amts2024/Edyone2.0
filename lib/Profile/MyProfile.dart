import 'package:edyon/Profile/Personaldetails.dart';
import 'package:flutter/material.dart';

import 'UpdateDetails.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 16, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'My Profile',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10), // Space between header and profile image
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    // Profile Image
                    Container(
                      width: 150, // Profile image width
                      height: 150, // Profile image height
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('icon/Frame117.png'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Edit Button
                    Positioned(
                      top: 12, // Aligns the button vertically with the image
                      right: -100, // Positions the button next to the image
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Padding inside the button
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(5), // Rounded corners
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'Edit',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8), // Gap between icon and text
                            Icon(Icons.edit, color: Colors.white, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5), // Space between profile image and text
              const Text(
                'Student Name',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 24 / 18, // Reduced line height
                  letterSpacing: 0.01,
                  color: Color(0xFF0B121F),
                ),
              ),
              const SizedBox(height: 2), // Reduced space between "Student Name" and "Class-10"
              const Text(
                'Class-10',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 18 / 14, // Reduced line height
                  letterSpacing: 0.01,
                  color: Color(0xFF70747E),
                ),
              ),

              const SizedBox(height: 30), // Space between text and new section
              Container(
                width: 388, // Fixed width
                height: 37, // Fixed height
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the Row within the Container
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10), // Padding: 10px top, 0px for other sides
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.transparent, // Border color is set to transparent
                              width: 3, // Border width: 3px
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center, // Center text horizontally and vertically
                          child: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds),
                            child: const Text(
                              'Personal Details',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.01,
                                color: Colors.white, // Text color is not used, as shader applies gradient
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Gap between the two text widgets
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10), // Padding: 10px top, 0px for other sides
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.transparent, // Border color is set to transparent
                              width: 3, // Border width: 3px
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center, // Center text horizontally and vertically
                          child: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds),
                            child: const Text(
                              'My Purchases',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                                letterSpacing: 0.01,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),



              ),
              personaldetails(),

              UpdateDetails(),

            ],
          ),
        ),
      ),
    );
  }
}


