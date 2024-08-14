import 'package:flutter/material.dart';

class Instructor extends StatelessWidget {
  const Instructor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0), // Simplified padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gradient container with image and text
          Container(
            width: 388,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Simplified border radius
              gradient: LinearGradient(
                colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    child: Image.asset(
                      'icon/calendar.png', // Replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10), // Gap between the image and text
                  Text(
                    'Click here to view Schedule',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.2, // Equivalent to line-height
                      letterSpacing: 0.01,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20), // Gap between gradient container and next section

          // Instructor details
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Instructor title
                Text(
                  "Instructor",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8), // Space between title and name

                // Instructor name
                Text(
                  "Saumy Verma",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    letterSpacing: 0.01,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 21), // Space before the row with image and details

                // Image and details row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Large image
                    Image.asset(
                      'icon/Ellipse21.png', // Replace with your large image path
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12), // Gap between image and details

                    // Details column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Courses detail
                        Row(
                          children: [
                            Image.asset(
                              'icon/akar.png', // Replace with your small image path
                              width: 10,
                              height: 10,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 4),
                            Text.rich(
                              TextSpan(
                                text: "4 ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Courses",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(height: 4),

                        // Experience detail
                        Row(
                          children: [
                            Image.asset(
                              'icon/akar.png', // Replace with your small image path
                              width: 10,
                              height: 10,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 4),
                            Text.rich(
                              TextSpan(
                                text: "5+ ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Experience",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(height: 4),

                        // Ratings detail
                        Row(
                          children: [
                            Image.asset(
                              'icon/akar.png', // Replace with your small image path
                              width: 10,
                              height: 10,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 4),
                            Text.rich(
                              TextSpan(
                                text: "4.8 ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Ratings",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 16), // Space before the paragraph

                // Paragraph text
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean consequat feugiat eget ut nibh. Mi bibendum at dui, laoreet. Iaculis sit at nulla amet ultrices proin neque arcu. Lacus tincidunt viverra ipsum sapien accumsan. Amet, mattis nisl netus in maecenas est mollis nunc tortor.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),

                SizedBox(height: 10),

                // View Profile button
                Container(
                  width: 388,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey, width: 1.0),
                  ),
                  child: Center(
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height)),
                      child: Text(
                        'View Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: 0.01,
                          color: Colors.white,
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
    );
  }
}
