import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../Api/Course_api.dart';
import 'CourseContent.dart';
import 'CourseReview.dart';
import 'FAQs.dart';
import 'intructorDetails.dart';

class CourseDetailsScreen extends StatefulWidget {
  final String courseId;

  CourseDetailsScreen({required this.courseId});

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  late Future<Map<String, dynamic>> _course;

  @override
  void initState() {
    super.initState();
    _course = fetchCourseDetails(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _course,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          } else {
            final course = snapshot.data!;
            return SingleChildScrollView(
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
                        const SizedBox(width: 8),
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
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 229,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(course['course_image'] ??
                              'https://example.com/default_image.png'),
                          fit: BoxFit.cover,
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
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/icon/Group.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
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
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${course['name'] ?? 'Course Name'} ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xFF0B121F),
                              ),
                            ),
                            TextSpan(
                              text: '(2023-24)',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFF0B121F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 4.0),
                        child: Text('This is a best course')
                        // Html(
                        //   data: course['description'] ??
                        //       '<p>No description available</p>',
                        // ),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 5),
                          _buildRatingStars(double.tryParse(
                                  course['course_rating'] ?? '0.0') ??
                              0.0),
                          const SizedBox(width: 8),
                          Text(
                            '${course['course_rating'] ?? 'N/A'} (${course['totalRating'] ?? '0'})',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF494949),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              course['teacher_image'] ??
                                  'https://example.com/unknown_teacher.png',
                              width: 32,
                              height: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            course['teacher_name'] ?? 'Unknown Teacher',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF494949),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'icon/healthicons.png',
                            width: 20,
                            height: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${course['couse_updated_at'] ?? 'Unknown'}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF494949),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon/fluent_local.png',
                            width: 20,
                            height: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ' ${course['language'] ?? 'Unknown'}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF494949),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon/ic.png',
                            width: 20,
                            height: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Hindi/English',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF494949),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Positioned(
                      top: 633, // Position from top
                      left: 15,
                      right: 15, // Position from left
                      child: Container(
                        width: 388, // Fixed width
                        height: 40, // Fixed height (hug)
                        decoration: BoxDecoration(
                          color: Colors.transparent, // Transparent background
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Space between the price label and button
                          children: [
                            // Container for price
                            Container(
                              width: 93, // Fixed width
                              height: 24, // Fixed height
                              margin: EdgeInsets.only(
                                left: 15,
                              ), // Margin from the left side

                              child: Text(
                                ' ${course['price'] ?? 'Free'}', // Provide default text
                                style: TextStyle(
                                  fontFamily: 'Poppins', // Font family
                                  fontSize: 20, // Font size
                                  fontWeight:
                                      FontWeight.w700, // Font weight 700
                                  // Line height calculated as height/size
                                  color: Colors.black, // Text color
                                  letterSpacing: 0, // Letter spacing
                                ),
                                textAlign: TextAlign.left, // Text alignment
                              ),
                            ),
                            // Container for image
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40, // Fixed width
                                  height: 40, // Fixed height

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
                                  width: 120,
                                  height: 32,
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFA10048),
                                        Color(0xFF2300FF)
                                      ],
                                      stops: [0.0, 1.0],
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add your onPressed code here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: Text(
                                      'Buy Now',
                                      style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 19.0, top: 4.0, right: 15, bottom: 0),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xff000000),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 4.0, right: 15),
                      child: Html(
                        data: course['description'] ??
                            '<p>No description available</p>',
                      ),
                    ),
                    SizedBox(height: 10),
                    // Image.network(course['course_image']),
                    Positioned(
                      top: 971, // Position from top
                      left: 40, // Position from left
                      child: Container(
                        width: double.infinity, // Expand to fit the content
                        height: 22, // Fixed height
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(
                              0), // Transparent background with 0 opacity
                        ),
                        padding: const EdgeInsets.only(
                            left: 20), // Padding for the paragraph
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
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align items to the start
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20), // 20px padding from the left
                                child: Container(
                                  width: 20, // Fixed width for the image
                                  height: 20, // Fixed height for the image
                                  decoration: BoxDecoration(
                                    color: Colors.transparent.withOpacity(
                                        0), // Transparent background for the image container
                                  ),
                                  child: Image.asset(
                                    'icon/akar.png', // Replace with your first image path
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit
                                        .cover, // Adjust image fit if needed
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
                                  overflow: TextOverflow
                                      .ellipsis, // Handle overflow with ellipsis
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
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Space between the price label and button
                          children: [
// Container for price
                            Container(
                              width: 93, // Fixed width
                              height: 24, // Fixed height
                              margin: EdgeInsets.only(
                                  left: 16), // Margin from the left side
                              child: Center(
                                child: Text(
                                  '₹ 1200.00', // Price text
                                  style: TextStyle(
                                    fontFamily: 'Poppins', // Font family
                                    fontSize: 20, // Font size
                                    fontWeight:
                                        FontWeight.w700, // Font weight 700
                                    height: 24 /
                                        20, // Line height calculated as height/size
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
                              margin: EdgeInsets.only(
                                  left: 100), // Margin from the left side
                              padding: const EdgeInsets.only(
                                  top: 8.75), // Padding around the image
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
                              margin: EdgeInsets.only(
                                  right: 10), // Margin from the right side
                              padding: EdgeInsets.fromLTRB(24.25, 10, 23.75,
                                  9), // Padding for the button
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)), // Border radius
                                  ),
                                  padding: EdgeInsets.zero, // Remove padding
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
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFA10048),
                                    Color(0xFF2300FF)
                                  ], // Gradient colors
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
            );
          }
        },
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(Icon(Icons.star, color: Colors.amber, size: 16));
      } else if (i == rating + 0.5) {
        stars.add(Icon(Icons.star_half, color: Colors.amber, size: 16));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.amber, size: 16));
      }
    }
    return Row(children: stars);
  }
}
