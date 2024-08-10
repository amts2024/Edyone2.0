import 'package:carousel_slider/carousel_controller.dart' as slider;
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  String? _selectedClass;
  String? _selectedSubject;

  final List<String> _classes = ['Class 1', 'Class 2', 'Class 3'];
  final List<String> _subjects = ['Math', 'Science', 'History'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                      width: 8), // Optional spacing between icon and text
                  const Text(
                    'Courses', // The text you want to display next to the icon
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              // Class Dropdown Button
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Align buttons with space between
                children: [
                  // Class Dropdown Button
                  Flexible(
                    child: Container(
                      height: 40, // Fixed height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), // Radius 5px
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFA10048),
                            Color(0xFF2300FF)
                          ], // Gradient colors
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1), // Border effect
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              13, 8, 13, 8), // Padding (13px, 8px, 13px, 8px)
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('Select Class'),
                              value: _selectedClass,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedClass = newValue;
                                });
                              },
                              items: _classes.map((classItem) {
                                return DropdownMenuItem(
                                  value: classItem,
                                  child: Text(classItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16), // Space between dropdowns
                  // Subject Dropdown Button
                  Flexible(
                    child: Container(
                      height: 40, // Fixed height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), // Radius 5px
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFA10048),
                            Color(0xFF2300FF)
                          ], // Gradient colors
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1), // Border effect
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              13, 8, 13, 8), // Padding (13px, 8px, 13px, 8px)
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('Select Subject'),
                              value: _selectedSubject,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedSubject = newValue;
                                });
                              },
                              items: _subjects.map((subjectItem) {
                                return DropdownMenuItem(
                                  value: subjectItem,
                                  child: Text(subjectItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Subject Dropdown Button

              // New Container
              SizedBox(height: 16),
              Positioned(
                top: 67, // Top position for the new container
                left: 20, // Left position for the new container
                child: Container(
                  width: 388, // Fixed width
                  height: 558, // Fixed height
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0), // Padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4), // Border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.1), // Shadow color with 10% opacity
                        offset: Offset(0, 4), // Shadow position (X: 0, Y: 4)
                        blurRadius: 10, // Shadow blur
                        spreadRadius: 0, // Shadow spread
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity, // Full width
                        height: 245, // Fixed height
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(4), // Border radius
                          image: DecorationImage(
                            image: AssetImage(
                                'images/image.jpg'), // Image asset path
                            alignment:
                                Alignment.topCenter, // Align image to the top
                          ),
                        ),
                      ),
                      SizedBox(height: 16), // Gap between the image and text
                      Container(
                        width: 211, // Fixed width for the first text
                        height: 19, // Fixed height for the first text
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Text(
                          'Mathematics', // First text content
                          style: TextStyle(
                            fontFamily: 'Poppins', // Use the Poppins font
                            fontWeight: FontWeight.w600, // Font weight 600
                            fontSize: 16, // Font size 16px
                            height: 19.2 /
                                16, // Line height, calculated based on font size
                            letterSpacing: 0.01 *
                                16, // 1% letter spacing, calculated based on font size
                            color: Color(0xFF494949), // Text color
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 4), // Small gap between the two text widgets
                      Container(
                        width: 250, // Fixed width for the second text
                        height: 17, // Fixed height for the second text
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Text(
                          'Complete NCERT Hindi Class 5', // Second text content
                          style: TextStyle(
                            fontFamily: 'Poppins', // Use the Poppins font
                            fontWeight: FontWeight.w400, // Font weight 400
                            fontSize: 14, // Font size 14px
                            height: 16.8 /
                                14, // Line height, calculated based on font size
                            color: Color(0xFF818181), // Text color
                          ),
                        ),
                      ),
                      SizedBox(
                          height:
                              10), // Small gap between the second and third text widgets
                      Container(
                        width: double
                            .infinity, // Fixed width for the layout container
                        height: 17, // Fixed height for the layout container
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Space between items
                          children: [
                            Container(
                              width: 99, // Fixed width for the third text
                              height: 17, // Fixed height for the third text
                              child: Text(
                                'Total Chapters', // Third text content
                                style: TextStyle(
                                  fontFamily: 'DM Sans', // Use the DM Sans font
                                  fontWeight:
                                      FontWeight.w700, // Font weight 700
                                  fontSize: 14, // Font size 14px
                                  height: 16.8 /
                                      14, // Line height, calculated based on font size
                                  color: Color(0xFF002ED2), // Text color
                                ),
                              ),
                            ),
                            Container(
                              width: 17, // Fixed width for the number
                              height: 17,
                              padding: EdgeInsets.fromLTRB(
                                  0, 0, 0, 0), // Fixed height for the number
                              child: Text(
                                '25', // Number text content
                                style: TextStyle(
                                  fontFamily: 'DM Sans', // Use the DM Sans font
                                  fontWeight:
                                      FontWeight.w700, // Font weight 700
                                  fontSize: 14, // Font size 14px
                                  height: 16.8 /
                                      14, // Line height, calculated based on font size
                                  color: Color(0xFF002ED2), // Text color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                          height:
                              10), // Small gap between the second and third text widgets
                      Container(
                        width: double
                            .infinity, // Fixed width for the layout container
                        height: 30, // Fixed height for the layout container
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 0), // Padding
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color(0xFFEDEDED),
                              width: 0.5,
                            ),
                            bottom: BorderSide(
                              color: Color(0xFFEDEDED),
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 99, // Fixed width for the text
                              height: 17,
                              // Fixed height for the text
                              child: Text(
                                'Course Rating', // Text content
                                style: TextStyle(
                                  fontFamily: 'DM Sans', // Use the DM Sans font
                                  fontWeight:
                                      FontWeight.w500, // Font weight 700
                                  fontSize: 15, // Font size 14px
                                  height: 16.8 /
                                      14, // Line height, calculated based on font size
                                  color: Color(0xFF494949), // Text color
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                // Full stars
                                for (var i = 0; i < 4; i++)
                                  Icon(
                                    Icons.star, // Star icon
                                    color: Colors.orange, // Star icon color
                                    size: 14, // Star icon size
                                  ),
                                // Half-colored star
                                Stack(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.grey.withOpacity(0.5),
                                      size: 14,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    width:
                                        5), // Space between stars and rating text
                                Text(
                                  '4.0 (2000)', // Rating and review count
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 16.8 / 14,
                                    color: Color(0xFF494949), // Text color
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                          height:
                              4), // Small gap between the second and third text widgets
                      Container(
                        width: double
                            .infinity, // Fixed width for the layout container
                        height: 30, // Fixed height for the layout container
                        // Padding
                        padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 96, // Fixed width for the text
                              height: 17, // Fixed height for the text
                              child: Row(
                                children: [
                                  Image.asset(
                                    'icon/courseicon.png', // Image asset path
                                    width: 16, // Image width
                                    height: 16, // Image height
                                  ),
                                  SizedBox(
                                      width: 4), // Space between image and text
                                  Text(
                                    'Live Classes', // Text content
                                    style: TextStyle(
                                      fontFamily:
                                          'DM Sans', // Use the DM Sans font
                                      fontWeight:
                                          FontWeight.w500, // Font weight 500
                                      fontSize: 12, // Font size 10px
                                      height: 16.8 /
                                          10, // Line height, calculated based on font size
                                      color: Color(0xFF494949), // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 128, // Fixed width for the text
                              height: 16, // Fixed height for the text
                              child: Row(
                                children: [
                                  Image.asset(
                                    'icon/courseicon.png', // Image asset path
                                    width: 16, // Image width
                                    height: 16, // Image height
                                  ),
                                  SizedBox(
                                      width: 4), // Space between image and text
                                  Text(
                                    'Recorded Classes', // Text content
                                    style: TextStyle(
                                      fontFamily:
                                          'DM Sans', // Use the DM Sans font
                                      fontWeight:
                                          FontWeight.w500, // Font weight 500
                                      fontSize: 12, // Font size 10px
                                      height: 16.8 /
                                          10, // Line height, calculated based on font size
                                      color: Color(0xFF494949), // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 91, // Fixed width for the text
                              height: 16, // Fixed height for the text
                              child: Row(
                                children: [
                                  Image.asset(
                                    'icon/courseicon.png', // Image asset path
                                    width: 16, // Image width
                                    height: 16, // Image height
                                  ),
                                  SizedBox(
                                      width: 4), // Space between image and text
                                  Text(
                                    'Mock Tests', // Text content
                                    style: TextStyle(
                                      fontFamily:
                                          'DM Sans', // Use the DM Sans font
                                      fontWeight:
                                          FontWeight.w500, // Font weight 500
                                      fontSize: 12, // Font size 10px
                                      height: 16.8 /
                                          10, // Line height, calculated based on font size
                                      color: Color(0xFF494949), // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double
                            .infinity, // Fixed width for the layout container
                        height: 30, // Fixed height for the layout container
                        margin: EdgeInsets.fromLTRB(12, 0, 16, 0), // Padding
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFEDEDED),
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 96, // Fixed width for the text
                              height: 16, // Fixed height for the text
                              child: Row(
                                children: [
                                  Image.asset(
                                    'icon/courseicon.png', // Image asset path
                                    width: 16, // Image width
                                    height: 16, // Image height
                                  ),
                                  SizedBox(
                                      width: 4), // Space between image and text
                                  Text(
                                    'DPP Sheets', // Text content
                                    style: TextStyle(
                                      fontFamily:
                                          'DM Sans', // Use the DM Sans font
                                      fontWeight:
                                          FontWeight.w500, // Font weight 500
                                      fontSize: 12, // Font size 10px
                                      height: 16.8 /
                                          10, // Line height, calculated based on font size
                                      color: Color(0xFF494949), // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 128, // Fixed width for the text
                              height: 16, // Fixed height for the text
                              child: Row(
                                children: [
                                  Image.asset(
                                    'icon/courseicon.png', // Image asset path
                                    width: 16, // Image width
                                    height: 16, // Image height
                                  ),
                                  SizedBox(
                                      width: 4), // Space between image and text
                                  Text(
                                    'Notes', // Text content
                                    style: TextStyle(
                                      fontFamily:
                                          'DM Sans', // Use the DM Sans font
                                      fontWeight:
                                          FontWeight.w500, // Font weight 500
                                      fontSize: 12, // Font size 10px
                                      height: 16.8 /
                                          10, // Line height, calculated based on font size
                                      color: Color(0xFF494949), // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 91, // Fixed width for the text
                              height: 16, // Fixed height for the text
                              child: Row(
                                children: [
                                  Image.asset(
                                    'icon/courseicon.png', // Image asset path
                                    width: 16, // Image width
                                    height: 16, // Image height
                                  ),
                                  SizedBox(
                                      width: 8), // Space between image and text
                                  Text(
                                    'MCQs', // Text content
                                    style: TextStyle(
                                      fontFamily:
                                          'DM Sans', // Use the DM Sans font
                                      fontWeight:
                                          FontWeight.w500, // Font weight 500
                                      fontSize: 12, // Font size 10px
                                      height: 16.8 /
                                          10, // Line height, calculated based on font size
                                      color: Color(0xFF494949), // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                          height:
                              20), // Small gap between the second and third text widgets
                      Container(
                        width: double
                            .infinity, // Fixed width for the layout container
                        height: 32, // Fixed height for the layout container
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0), // Padding
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 155, // Fixed width for the text
                              height: 32,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'icon/Ellipse.png', // Image asset path
                                    width: 32, // Image width
                                    height: 32, // Image height
                                  ),
                                  SizedBox(
                                      width: 8), // Fixed height for the text
                                  Text(
                                    'Instructor Name', // Text content
                                    style: TextStyle(
                                      fontFamily:
                                          'DM Sans', // Use the DM Sans font
                                      fontWeight:
                                          FontWeight.w500, // Font weight 700
                                      fontSize: 15, // Font size 14px
                                      height: 16.8 /
                                          14, // Line height, calculated based on font size
                                      color: Color(0xFF494949), // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                // Full stars
                                for (var i = 0; i < 4; i++)
                                  Icon(
                                    Icons.star, // Star icon
                                    color: Colors.orange, // Star icon color
                                    size: 14, // Star icon size
                                  ),
                                // Half-colored star
                                Stack(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.grey.withOpacity(0.5),
                                      size: 14,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    width:
                                        5), // Space between stars and rating text
                                Text(
                                  '4.0 (50)', // Rating and review count
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 16.8 / 14,
                                    color: Color(0xFF494949), // Text color
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),
                      Container(
                        width: double.infinity, // Full width of the parent
                        height: 48, // Fixed height for the container
                        padding: EdgeInsets.zero, // Remove any padding
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3), // Background color
                          border: Border.all(
                            color: Color(0xFFEDEDED), // Border color
                            width: 0.5, // Border width
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Space between the price label and button
                          children: [
                            // Container for price
                            Container(
                              width: 62, // Fixed width for the price container
                              height:
                                  24, // Fixed height for the price container
                              margin: EdgeInsets.only(
                                  left: 16), // Margin from the left side
                              child: Center(
                                child: Text(
                                  '₹ 1200', // Price text
                                  style: TextStyle(
                                    fontFamily: 'Poppins', // Font family
                                    fontWeight:
                                        FontWeight.w700, // Font weight 700
                                    fontSize: 20, // Font size 20px
                                    height: 24 /
                                        20, // Line height calculated as height/size
                                    color: Color(0xFF3C3C3C), // Text color
                                  ),
                                ),
                              ),
                            ),
                            // Container for image
                            Container(
                              width: 32, // Fixed width for the image container
                              height:
                                  32, // Fixed height for the image container
                              margin: EdgeInsets.only(
                                  left: 80), // Margin from the right side
                              decoration: BoxDecoration(
                                color: Colors
                                    .white, // Background color of the image container
                                borderRadius:
                                    BorderRadius.circular(4), // Border radius
                                border: Border.all(
                                  color: Color(0xFF1A21BC), // Border color
                                  width: 0.5, // Border width
                                ),
                              ),

                              child: Image.asset(
                                'icon/Frame.png', // Path to your image asset
                                width: 20, // Image width
                                height: 20, // Image height
                              ),
                            ),
                            // Gradient Button Container
                            Container(
                              width:
                                  100, // Fixed width for the button container
                              height:
                                  32, // Fixed height for the button container
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(4), // Border radius
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFA10048),
                                    Color(0xFF2300FF)
                                  ], // Gradient colors
                                  stops: [0.0, 1.0], // Gradient stops
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your onPressed code here
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .transparent, // Transparent background
                                  shadowColor:
                                      Colors.transparent, // Remove shadow
                                  elevation: 0, // Remove elevation
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        4), // Border radius
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Button', // Button text
                                    style: TextStyle(
                                      fontFamily: 'DM Sans', // Font family
                                      fontWeight:
                                          FontWeight.w500, // Font weight
                                      fontSize: 14, // Font size
                                      color: Colors.white, // Text color
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
