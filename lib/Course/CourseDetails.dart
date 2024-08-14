import 'package:flutter/material.dart';

import 'CourseContent.dart';
import 'CourseReview.dart';
import 'FAQs.dart';
import 'intructorDetails.dart';

class CourseDetailsScreen extends StatefulWidget {
  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 16, 0.0, 0.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8), // Optional spacing between icon and text
                  const Text(
                    'Course Details',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Space between text and background image
              Container(
                width: double.infinity, // Adaptive width
                height: 229, // Fixed height for the background image container
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('icon/unsplash_1.png'), // Background image path
                    fit: BoxFit.cover, // Ensure the image covers the entire container
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF454545).withOpacity(0.32),
                      Color(0xFF000000),
                    ],
                    stops: [0.0, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center, // Center elements
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60, // Centered image width
                          height: 60, // Centered image height
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('icon/Group.png'), // Centered image path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8), // Space between image and text
                        const Text(
                          'Have a look at course',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Space between image and the new text widget
              Padding(
                padding: const EdgeInsets.only(left: 20.0), // Left padding for alignment
                child: Container(
                  width: 388, // Width of the text container
                  height: 30, // Height of the text container
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Course Subject Name ', // Text content
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600, // Font weight 600 (bold)
                            fontSize: 18, // Font size 18px
                            color: Color(0xFF0B121F), // Text color
                          ),
                        ),
                        TextSpan(
                          text: '(2023-24)', // Year content
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400, // Font weight normal
                            fontSize: 14, // Smaller font size
                            color: Color(0xFF0B121F), // Text color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 4.0), // Adjust padding for alignment
                child: Container(
                  width: 387, // Width of the paragraph container
                  height: 69, // Height of the paragraph container
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id suscipit at rutrum ultricies. Ut vitae elit nisi, quis tortor porta. Gravida donec porttitor a faucibus.', // Paragraph content
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400, // Font weight 400
                      fontSize: 14, // Font size 14px
                      height: 1.5, // Line height (21px)
                      letterSpacing: 0.01, // 1% letter spacing
                      color: Color(0xFF70747E), // Text color
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 4.0), // Adjust padding for alignment
                child: Row(
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
                    const SizedBox(width: 5), // Space between stars and rating text
                    const Text(
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
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                width: double.infinity, // Fixed width for the text
                height: 32, // Fixed height for the text
                child: Row(
                  children: [
                    Image.asset(
                      'icon/Ellipse.png', // Image asset path
                      width: 32, // Image width
                      height: 32, // Image height
                    ),
                    const SizedBox(width: 8), // Space between image and text
                    const Text(
                      'Instructor Name', // Text content
                      style: TextStyle(
                        fontFamily: 'Poppins', // Use the DM Sans font
                        fontWeight: FontWeight.w400, // Font weight 700
                        fontSize: 14, // Font size 14px
                        height: 21 / 14, // Line height, calculated based on font size
                        color: Color(0xFF494949), // Text color
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Positioned(
                top: 549, // Position from top
                left: 20, // Position from left
                child: Container(
                  width: double.infinity, // Width of the container
                  height: 66, // Height of the container
                  color: Colors.transparent, // Fully transparent
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20), // Space from the left
                            child: Container(
                              width: 20, // Width of the image container
                              height: 20, // Height of the image container
                              child: Image.asset(
                                'icon/healthicons.png', // Replace with your image asset path
                                width: 20, // Width of the image
                                height: 20, // Height of the image
                                color: Colors.black, // Opacity of the image
                              ),
                            ),
                          ),
                          const SizedBox(width: 10), // Gap between image and text (3px)
                          Container(
                            width: 123, // Width of the text container
                            height: 15, // Height of the text container
                            alignment: Alignment.centerLeft, // Align text to the left
                            child: const Text(
                              'Last Updated 12-01-2022', // Text content
                              style: TextStyle(
                                fontFamily: 'Poppins', // Font family
                                fontSize: 10, // Font size
                                fontWeight: FontWeight.w400, // Font weight
                                height: 15 / 10, // Line height
                                letterSpacing: 0.005, // Letter spacing

                              ),
                              textAlign: TextAlign.left, // Text alignment
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3), // Space between rows
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20), // Space from the left
                            child: Container(
                              width: 20, // Width of the image container
                              height: 20, // Height of the image container
                              child: Image.asset(
                                'icon/fluent_local.png', // Replace with your image asset path
                                width: 20, // Width of the image
                                height: 20, // Height of the image
                                color: Colors.black, // Opacity of the image
                              ),
                            ),
                          ),
                          const SizedBox(width: 10), // Gap between image and text (3px)
                          Container(
                            width: 123, // Width of the text container
                            height: 15, // Height of the text container
                            alignment: Alignment.centerLeft, // Align text to the left
                            child: const Text(
                              'English', // Text content for second row
                              style: TextStyle(
                                fontFamily: 'Poppins', // Font family
                                fontSize: 10, // Font size
                                fontWeight: FontWeight.w400, // Font weight
                                height: 15 / 10, // Line height
                                letterSpacing: 0.005, // Letter spacing

                              ),
                              textAlign: TextAlign.left, // Text alignment
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3), // Space between rows
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20), // Space from the left
                            child: Container(
                              width: 20, // Width of the image container
                              height: 20, // Height of the image container
                              child: Image.asset(
                                'icon/ic.png', // Replace with your image asset path
                                width: 20, // Width of the image
                                height: 20, // Height of the image
                                color: Colors.black, // Opacity of the image
                              ),
                            ),
                          ),
                          const SizedBox(width: 10), // Gap between image and text (3px)
                          Container(
                            width: 123, // Width of the text container
                            height: 15, // Height of the text container
                            alignment: Alignment.centerLeft, // Align text to the left
                            child: const Text(
                              'English, Hindi', // Text content for third row
                              style: TextStyle(
                                fontFamily: 'Poppins', // Font family
                                fontSize: 10, // Font size
                                fontWeight: FontWeight.w400, // Font weight
                                height: 15 / 10, // Line height
                                letterSpacing: 0.005, // Letter spacing

                              ),
                              textAlign: TextAlign.left, // Text alignment
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              Positioned(
                top: 633, // Position from top
                left: 20, // Position from left
                child: Container(
                  width: 388, // Fixed width
                  height: 40, // Fixed height (hug)
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Transparent background
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the price label and button
                    children: [
                      // Container for price
                      Container(
                        width: 93, // Fixed width
                        height: 24, // Fixed height
                        margin: EdgeInsets.only(left: 16), // Margin from the left side
                        child: Center(
                          child: Text(
                            '₹ 1200.00', // Price text
                            style: TextStyle(
                              fontFamily: 'Poppins', // Font family
                              fontSize: 20, // Font size
                              fontWeight: FontWeight.w700, // Font weight 700
                              height: 24 / 20, // Line height calculated as height/size
                              color: Colors.black, // Text color
                              letterSpacing: 0, // Letter spacing
                            ),
                            textAlign: TextAlign.left, // Text alignment
                          ),
                        ),
                      ),
                      // Container for image
                      Container(
                        width: 40, // Fixed width
                        height: 40, // Fixed height
                        margin: EdgeInsets.only(left: 100), // Margin from the left side
                        padding: const EdgeInsets.only(top: 8.75), // Padding around the image
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          child: Image.asset(
                            'icon/Frame.png', // Path to your image asset
                            width: 40, // Image width
                            height: 40, // Image height
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                      ),
                      // Gradient Button Container
                      Container(
                        width: 125, // Fixed width
                        height: 40, // Fixed height
                        margin: EdgeInsets.only(right: 10), // Margin from the right side
                        padding: EdgeInsets.fromLTRB(24.25, 10, 23.75, 9), // Padding for the button
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your onPressed code here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, // Transparent background
                            shadowColor: Colors.transparent, // Remove shadow
                            elevation: 0, // Remove elevation
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)), // Border radius
                            ),
                            padding: EdgeInsets.zero, // Remove padding
                          ),
                          child: Center(
                            child: Text(
                              'Button', // Button text
                              style: TextStyle(
                                fontFamily: 'DM Sans', // Font family
                                fontWeight: FontWeight.w500, // Font weight
                                fontSize: 14, // Font size
                                color: Colors.white, // Text color
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gradient: LinearGradient(
                            colors: [Color(0xFFA10048), Color(0xFF2300FF)], // Gradient colors
                            stops: [0.0, 1.0], // Gradient stops
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
              Positioned(
                top: 689, // Position from top
                left: 20, // Position from left
                child: Container(
                  width: 388, // Hug width
                  height: 308, // Hug height
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
                            'Description', // Replace with actual content
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
                        padding: const EdgeInsets.only(left: 20, top:10), // Padding for the paragraph
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est amet purus est sit risus, leo in aliquam. Duis semper amet, at integer. Nulla diam a, sagittis id eget sed malesuada tempus ligula.', // Replace with actual content
                          style: TextStyle(
                            fontFamily: 'Poppins', // Font family
                            fontSize: 14, // Font size
                            fontWeight: FontWeight.w400, // Font weight
                            height: 1.4, // Line height (calculated as 19.6px for 14px font size)
                            color: Color(0xFF000000), // Text color
                          ),
                        ),
                      ),
                      // Break (space) after the first paragraph
                      SizedBox(height: 10), // Adjust height as needed

                      // Third child: Second part of paragraph text
                      Padding(
                        padding: const EdgeInsets.only(left: 20), // Padding for the paragraph
                        child: Container(
                          width: 340, // Adjust width to control line breaks
                          child: Text(
                            'Tortor integer lacus fames proin neque et consectetur. Vel ante gravida a sit suspendisse mauris risus. Gravida lorem mi tellus sodales facilisi amet, risus aliquet lectus. Elementum montes, cursus a tempus mattis ullamcorper malesuada. Scelerisque tellus aenean neque in volutpat. Sollicitudin aliquet scelerisque integer amet sapien imperdiet.', // Replace with actual content
                            style: TextStyle(
                              fontFamily: 'Poppins', // Font family
                              fontSize: 14, // Font size
                              fontWeight: FontWeight.w400, // Font weight
                              height: 1.4, // Line height (calculated as 19.6px for 14px font size)
                              color: Color(0xFF000000), // Text color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
              Positioned(
                top: 971, // Position from top
                left: 40, // Position from left
                child: Container(
                  width: double.infinity, // Expand to fit the content
                  height: 22, // Fixed height
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0), // Transparent background with 0 opacity
                  ),
                  padding: const EdgeInsets.only(left: 20), // Padding for the paragraph
                  child: Text(
                    'This Course Includes', // Text content
                    style: TextStyle(
                      fontFamily: 'Poppins', // Font family
                      fontSize: 18, // Font size
                      fontWeight: FontWeight.w600, // Font weight
                      height: 21.6 / 18, // Line height
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment
                  ),
                ),
              ),

              SizedBox(height: 10),
              Positioned(
                top: 1005, // Adjust as needed
                left: 20, // 20px space from the left
                child: Column(
                  children: [
                    // First row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20), // 20px padding from the left
                          child: Container(
                            width: 20, // Fixed width for the image
                            height: 20, // Fixed height for the image
                            decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0), // Transparent background for the image container
                            ),
                            child: Image.asset(
                              'icon/akar.png', // Replace with your first image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover, // Adjust image fit if needed
                            ),
                          ),
                        ),
                        SizedBox(width: 6), // Gap between image and text
                        Container(

                          height: 17, // Fixed height for the text
                          child: Text(
                            'Live Classes', // First text
                            style: TextStyle(
                              fontFamily: 'Poppins', // Font family
                              fontSize: 14, // Font size
                              fontWeight: FontWeight.w500, // Font weight
                              height: 16.8 / 14, // Line height
                            ),
                            textAlign: TextAlign.left, // Text alignment
                            maxLines: 1, // Ensure single line of text
                            overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Space between rows

                    // Second row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/akar.png', // Replace with your second image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(

                          height: 17,
                          child: Text(
                            'MCQs', // Second text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Repeat similar structure for the third, fourth, fifth, sixth, and seventh rows
                    // Third row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/akar.png', // Replace with your third image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(

                          height: 17,
                          child: Text(
                            'Record Classes', // Third text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Fourth row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/akar.png', // Replace with your fourth image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(

                          height: 17,
                          child: Text(
                            'More 140 Downloadable Resources', // Fourth text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Fifth row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/akar.png', // Replace with your fifth image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(

                          height: 17,
                          child: Text(
                            'Mock Tests', // Fifth text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Sixth row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/akar.png', // Replace with your sixth image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(

                          height: 17,
                          child: Text(
                            'Certificate of completion', // Sixth text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Seventh row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/akar.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(

                          height: 17,
                          child: Text(
                            'Live Doubts Solution', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Seventh row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/akar.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(

                          height: 17,
                          child: Text(
                            'Access on mobile and TV', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Seventh row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/akar.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(

                          height: 17,
                          child: Text(
                            'DPP Sheets', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Seventh row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/akar.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(

                          height: 17,
                          child: Text(
                            'lifetime access', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Seventh row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/akar.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(

                          height: 17,
                          child: Text(
                            'Notes', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Coursecontent(),

              Instructor(),

              CourseReview(),

              Faqs(),

              SizedBox(height: 10),

              Positioned(
                top: 633, // Position from top
                left: 20, // Position from left
                child: Container(
                  width: 388, // Fixed width
                  height: 40, // Fixed height (hug)
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Transparent background
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the price label and button
                    children: [
                      // Container for price
                      Container(
                        width: 93, // Fixed width
                        height: 24, // Fixed height
                        margin: EdgeInsets.only(left: 16), // Margin from the left side
                        child: Center(
                          child: Text(
                            '₹ 1200.00', // Price text
                            style: TextStyle(
                              fontFamily: 'Poppins', // Font family
                              fontSize: 20, // Font size
                              fontWeight: FontWeight.w700, // Font weight 700
                              height: 24 / 20, // Line height calculated as height/size
                              color: Colors.black, // Text color
                              letterSpacing: 0, // Letter spacing
                            ),
                            textAlign: TextAlign.left, // Text alignment
                          ),
                        ),
                      ),
                      // Container for image
                      Container(
                        width: 40, // Fixed width
                        height: 40, // Fixed height
                        margin: EdgeInsets.only(left: 100), // Margin from the left side
                        padding: const EdgeInsets.only(top: 8.75), // Padding around the image
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          child: Image.asset(
                            'icon/Frame.png', // Path to your image asset
                            width: 40, // Image width
                            height: 40, // Image height
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                      ),
                      // Gradient Button Container
                      Container(
                        width: 125, // Fixed width
                        height: 40, // Fixed height
                        margin: EdgeInsets.only(right: 10), // Margin from the right side
                        padding: EdgeInsets.fromLTRB(24.25, 10, 23.75, 9), // Padding for the button
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your onPressed code here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, // Transparent background
                            shadowColor: Colors.transparent, // Remove shadow
                            elevation: 0, // Remove elevation
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)), // Border radius
                            ),
                            padding: EdgeInsets.zero, // Remove padding
                          ),
                          child: Center(
                            child: Text(
                              'Button', // Button text
                              style: TextStyle(
                                fontFamily: 'DM Sans', // Font family
                                fontWeight: FontWeight.w500, // Font weight
                                fontSize: 14, // Font size
                                color: Colors.white, // Text color
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gradient: LinearGradient(
                            colors: [Color(0xFFA10048), Color(0xFF2300FF)], // Gradient colors
                            stops: [0.0, 1.0], // Gradient stops
                          ),
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
