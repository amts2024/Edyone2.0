import 'package:flutter/material.dart';

class Coursecontent extends StatelessWidget {
const Coursecontent({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 16, 5.0, 0.0),
          child: Column(
            children: [
              // Existing content
              Positioned(
                top: 1413, // Position from top
                left: 20, // Position from left
                child: Container(
                  width: 388, // Hug width
                  height: 690, // Hug height
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Transparent background
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // Align children at the start
                    crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                    children: [
                      // First child: Description text
                      Container(
                        width: double.infinity, // Full width of the parent
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5), // Border radius
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20), // Padding inside the container
                          child: Text(
                            'Course Content', // Replace with actual content
                            style: TextStyle(
                              fontFamily: 'Poppins', // Font family
                              fontSize: 18, // Font size
                              fontWeight: FontWeight.w600, // Font weight
                              color: Colors.black, // Text color
                            ),
                          ),
                        ),
                      ),

                      // Second child: First part of paragraph text
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10), // Padding for the paragraph
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus velit aliquam consequat eu nunc sed. Nec quis ut purus nunc malesuada augue pellentesque fermentum. ', // Replace with actual content
                          style: TextStyle(
                            fontFamily: 'Poppins', // Font family
                            fontSize: 14, // Font size
                            fontWeight: FontWeight.w400, // Font weight
                            height: 16.8 / 14, // Line height (calculated as 19.6px for 14px font size)
                            color: Color(0xFF70747E), // Text color
                          ),
                        ),
                      ),

                      // Chapter 1
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 388, // Full width
                          padding: EdgeInsets.symmetric(vertical: 20.0), // Padding
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 18, // Image width
                                    height: 18, // Image height
                                    child: Image.asset(
                                      'icon/icons8_down.png', // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16), // Gap between image and text
                                  Text(
                                    'Chapter 1', // Replace with actual chapter content
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 28 / 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Total Topics: 15', // Replace with actual topics count
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Chapter 2
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 388, // Full width
                          padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 18, // Image width
                                    height: 18, // Image height
                                    child: Image.asset(
                                      'icon/icons8_down.png', // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16), // Gap between image and text
                                  Text(
                                    'Chapter 2', // Replace with actual chapter content
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 28 / 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Total Topics: 15', // Replace with actual topics count
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Chapter 3
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 388, // Full width
                          padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 18, // Image width
                                    height: 18, // Image height
                                    child: Image.asset(
                                      'icon/icons8_down.png', // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16), // Gap between image and text
                                  Text(
                                    'Chapter 3', // Replace with actual chapter content
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 28 / 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Total Topics: 15', // Replace with actual topics count
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Chapter 4
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 388, // Full width
                          padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 18, // Image width
                                    height: 18, // Image height
                                    child: Image.asset(
                                      'icon/icons8_down.png', // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16), // Gap between image and text
                                  Text(
                                    'Chapter 4', // Replace with actual chapter content
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 28 / 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Total Topics: 15', // Replace with actual topics count
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Chapter 5
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 388, // Full width
                          padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 18, // Image width
                                    height: 18, // Image height
                                    child: Image.asset(
                                      'icon/icons8_down.png', // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16), // Gap between image and text
                                  Text(
                                    'Chapter 5', // Replace with actual chapter content
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 28 / 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Total Topics: 15', // Replace with actual topics count
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Chapter 6
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 388, // Full width
                          padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 18, // Image width
                                    height: 18, // Image height
                                    child: Image.asset(
                                      'icon/icons8_down.png', // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16), // Gap between image and text
                                  Text(
                                    'Chapter 6', // Replace with actual chapter content
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 28 / 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Total Topics: 15', // Replace with actual topics count
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Chapter 7
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 388, // Full width
                          padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 18, // Image width
                                    height: 18, // Image height
                                    child: Image.asset(
                                      'icon/icons8_down.png', // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16), // Gap between image and text
                                  Text(
                                    'Chapter 7', // Replace with actual chapter content
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 28 / 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Total Topics: 15', // Replace with actual topics count
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Chapter 8
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 388, // Full width
                          padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 18, // Image width
                                    height: 18, // Image height
                                    child: Image.asset(
                                      'icon/icons8_down.png', // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16), // Gap between image and text
                                  Text(
                                    'Chapter 8', // Replace with actual chapter content
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      height: 28 / 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Total Topics: 15', // Replace with actual topics count
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // View More Button
                      SizedBox(height: 20), // Gap between image and text

                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right:20), // Add padding on left and right
                        child: Container(
                          width: 388,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                            border: Border.all(color: Colors.grey, width: 1.0), // Simplified border definition
                          ),
                          child: Center(
                            child: ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).createShader(Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height)),
                              child: Text(
                                'View More',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 21 / 14,
                                  letterSpacing: 0.01,
                                  color: Colors.white, // The base color is white, but this is masked by the gradient
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),



            ],
          ),
    );


  }
}
