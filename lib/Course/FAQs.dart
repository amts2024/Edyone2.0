import 'package:flutter/material.dart';

class Faqs extends StatelessWidget {
  const Faqs({super.key});



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
                        'FAQs', // Replace with actual content
                        style: TextStyle(
                          fontFamily: 'Poppins', // Font family
                          fontSize: 18, // Font size
                          fontWeight: FontWeight.w600, // Font weight
                          height:21.6/18,
                          color: Colors.black, // Text color
                        ),
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


                        mainAxisAlignment: MainAxisAlignment.start, // Align children at the start
                        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Ques: ', // Replace with actual chapter content
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    height: 21 / 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8), // Gap between text and description
                                Expanded(
                                  child: Container(
                                    height: 42, // Height of 42px
                                    child: Text(
                                      'Lorem ipsum dolor sit amet Malesuada lobortis semper pellentesque lacus.', // Replace with actual topics count
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        height: 21 / 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                      maxLines: 2, // Allow up to 2 lines
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16), // Gap between text and icon
                          Container(
                            width: 32, // Image width
                            height: 32, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


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
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Ques: ', // Replace with actual chapter content
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    height: 21 / 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8), // Gap between text and description
                                Expanded(
                                  child: Container(
                                    height: 42, // Height of 42px
                                    child: Text(
                                      'Lorem ipsum dolor sit amet Malesuada lobortis semper pellentesque lacus.', // Replace with actual topics count
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        height: 21 / 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                      maxLines: 2, // Allow up to 2 lines
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16), // Gap between text and icon
                          Container(
                            width: 32, // Image width
                            height: 32, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
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
                      padding: EdgeInsets.symmetric(vertical: 20.0), // Padding
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Ques: ', // Replace with actual chapter content
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    height: 21 / 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8), // Gap between text and description
                                Expanded(
                                  child: Container(
                                    height: 42, // Height of 42px
                                    child: Text(
                                      'Lorem ipsum dolor sit amet Malesuada lobortis semper pellentesque lacus.', // Replace with actual topics count
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        height: 21 / 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                      maxLines: 2, // Allow up to 2 lines
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16), // Gap between text and icon
                          Container(
                            width: 32, // Image width
                            height: 32, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
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
                      padding: EdgeInsets.symmetric(vertical: 20.0), // Padding
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Ques: ', // Replace with actual chapter content
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    height: 21 / 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8), // Gap between text and description
                                Expanded(
                                  child: Container(
                                    height: 42, // Height of 42px
                                    child: Text(
                                      'Lorem ipsum dolor sit amet Malesuada lobortis semper pellentesque lacus.', // Replace with actual topics count
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        height: 21 / 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                      maxLines: 2, // Allow up to 2 lines
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16), // Gap between text and icon
                          Container(
                            width: 32, // Image width
                            height: 32, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
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
                      padding: EdgeInsets.symmetric(vertical: 20.0), // Padding
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Ques: ', // Replace with actual chapter content
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    height: 21 / 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8), // Gap between text and description
                                Expanded(
                                  child: Container(
                                    height: 42, // Height of 42px
                                    child: Text(
                                      'Lorem ipsum dolor sit amet Malesuada lobortis semper pellentesque lacus.', // Replace with actual topics count
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        height: 21 / 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                      maxLines: 2, // Allow up to 2 lines
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16), // Gap between text and icon
                          Container(
                            width: 32, // Image width
                            height: 32, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
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
                      padding: EdgeInsets.symmetric(vertical: 20.0), // Padding
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Ques: ', // Replace with actual chapter content
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    height: 21 / 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8), // Gap between text and description
                                Expanded(
                                  child: Container(
                                    height: 42, // Height of 42px
                                    child: Text(
                                      'Lorem ipsum dolor sit amet Malesuada lobortis semper pellentesque lacus.', // Replace with actual topics count
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        height: 21 / 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                      maxLines: 2, // Allow up to 2 lines
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16), // Gap between text and icon
                          Container(
                            width: 32, // Image width
                            height: 32, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
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
                      padding: EdgeInsets.symmetric(vertical: 20.0), // Padding
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)), // Bottom border
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Ques: ', // Replace with actual chapter content
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    height: 21 / 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8), // Gap between text and description
                                Expanded(
                                  child: Container(
                                    height: 42, // Height of 42px
                                    child: Text(
                                      'Lorem ipsum dolor sit amet Malesuada lobortis semper pellentesque lacus.', // Replace with actual topics count
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        height: 21 / 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                      maxLines: 2, // Allow up to 2 lines
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16), // Gap between text and icon
                          Container(
                            width: 32, // Image width
                            height: 32, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
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
