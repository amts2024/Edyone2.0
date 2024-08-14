import 'package:edyon/Profile/Personaldetails.dart';
import 'package:flutter/material.dart';

import 'UpdateDetails.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _isEditingName = false;
  bool _showPersonalDetails = true; // Added boolean to toggle content

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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPersonalDetails = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Personal Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: _showPersonalDetails
                                    ? [Color(0xFFA10048), Color(0xFF2300FF)]
                                    : [Colors.black, Colors.black],
                              ).createShader(
                                Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                              ),
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 170,
                          decoration: BoxDecoration(
                            gradient: _showPersonalDetails
                                ? LinearGradient(
                              colors: [
                                Color(0xFFA10048),
                                Color(0xFF2300FF)
                              ],
                            )
                                : LinearGradient(
                              colors: [Colors.transparent, Colors.transparent],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPersonalDetails = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'My Purchase',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: !_showPersonalDetails
                                    ? [Color(0xFFA10048), Color(0xFF2300FF)]
                                    : [Colors.black, Colors.black],
                              ).createShader(
                                Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                              ),
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 170,
                          decoration: BoxDecoration(
                            gradient: !_showPersonalDetails
                                ? LinearGradient(
                              colors: [
                                Color(0xFFA10048),
                                Color(0xFF2300FF)
                              ],
                            )
                                : LinearGradient(
                              colors: [Colors.transparent, Colors.transparent],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _showPersonalDetails
                  ? personaldetails()
                  : PurchaseHistoryPage(), // Conditionally show content based on the selected tab



              //UpdateDetails(),

            ],
          ),
        ),
      ),
    );
  }
}
class PurchaseHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20), // Add top margin
      width: 388, // Specified width
      height: 120, // Specified height
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8), // Top-left border radius
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15), // Shadow color with opacity
            spreadRadius: 0,
            blurRadius: 20, // Blur radius for shadow
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Optional padding inside the container
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 104,
              height: 91,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                ),
                image: DecorationImage(
                  image: AssetImage('icon/unsplash__zsL306fDck.png'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8), // Space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the two texts
                    children: [
                      Text(
                        'Mathematics',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.2, // Equivalent to 16.8px line height
                          letterSpacing: 0.01,
                          color: Color(0xFF494949),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4), // Space between texts
                  Text(
                    'Complete NCERT Hindi Class 5',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 14.4/12, // Equivalent to 14.4px line height
                      color: Color(0xFF818181),
                    ),
                  ),
                  const SizedBox(height: 4), // Space between texts
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Chapters: 25',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          height: 12 / 10, // Equivalent to 12px line height
                          color: Color(0xFF002ED2),
                        ),
                      ),
                      const SizedBox(height: 8), // Spacing between text and new row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the instructor info and remove section
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 24, // Image width
                                height: 24, // Image height
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4), // Image border radius
                                  image: DecorationImage(
                                    image: AssetImage('icon/Avatars.png'), // Replace with your image path
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10), // Gap between image and text
                              Text(
                                'Instructor Name',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 18 / 12, // Equivalent to 18px line height
                                  color: Color(0xFF170F49),
                                ),
                              ),
                            ],
                          ),
                        ],
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


