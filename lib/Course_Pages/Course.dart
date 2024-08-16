// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../Modal/Course_model.dart';
//
// class CoursesScreen extends StatefulWidget {
//   @override
//   _CoursesScreenState createState() => _CoursesScreenState();
// }
//
// class _CoursesScreenState extends State<CoursesScreen> {
//   String? _selectedClass;
//   String? _selectedSubject;
//   List<Course> _courses = [];
//   bool _isLoading = true;
//   String _errorMessage = '';
//
//   final List<String> _classes = [
//     'Class 1',
//     'Class 2',
//     'Class 3',
//     '4th',
//     '5th',
//     '6th',
//     '7th',
//     '8th',
//     '9th',
//     '10th',
//     '11th',
//     '12th'
//   ];
//   final List<String> _subjects = ['Math', 'Science', 'History'];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchCourses(); // Fetch courses initially
//   }
//
//   Future<void> _fetchCourses() async {
//     final url = 'https://admin.edyone.site/api/course/get-list';
//     final headers = {
//       'Authorization': 'Bearer lPpIG4JNsrzakZtGlcxgjiglFVfeWMg8LIX2ydPO',
//       'Content-Type': 'application/json'
//     };
//
//     // Prepare request body with selected filters
//     final body = jsonEncode(
//         {'class': _selectedClass, 'subject': _selectedSubject, 'per_page': 5});
//
//     try {
//       final response =
//           await http.post(Uri.parse(url), headers: headers, body: body);
//
//       // Debugging: Print the response status and body
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final courseData = data['data'] as List? ?? [];
//         final courses = courseData
//             .map((courseJson) => Course.fromJson(courseJson))
//             .toList();
//
//         setState(() {
//           _courses = courses;
//           _isLoading = false;
//           _errorMessage = ''; // Clear error message on success
//         });
//       } else {
//         throw Exception('No Course Avilable');
//       }
//     } catch (e) {
//       print('Error: $e');
//       setState(() {
//         _courses = []; // Clear courses on error
//         _isLoading = false;
//         _errorMessage = 'No Course Avilable';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Row(
//               //   children: [
//               //     IconButton(
//               //       icon: const Icon(Icons.arrow_back_ios_sharp),
//               //       onPressed: () {
//               //         Navigator.pop(context);
//               //       },
//               //     ),
//               //     const SizedBox(width: 8),
//               //     const Text(
//               //       'Courses',
//               //       style: TextStyle(
//               //         fontFamily: 'Poppins',
//               //         fontWeight: FontWeight.bold,
//               //         fontSize: 22,
//               //         color: Color(0xFF0B121F),
//               //       ),
//               //     ),
//               //   ],
//               // ),
//               // SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Flexible(
//                     child: Container(
//                       height: 40,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         gradient: LinearGradient(
//                           colors: [Color(0xFFA10048), Color(0xFF2300FF)],
//                           stops: [0.0, 1.0],
//                         ),
//                       ),
//                       child: Container(
//                         margin: EdgeInsets.all(1),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.fromLTRB(13, 8, 13, 8),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<String>(
//                               isExpanded: true,
//                               hint: Text('Select Class'),
//                               value: _selectedClass,
//                               onChanged: (newValue) {
//                                 setState(() {
//                                   _selectedClass = newValue;
//                                   _isLoading = true;
//                                   _fetchCourses(); // Fetch courses again when class changes
//                                 });
//                               },
//                               items: _classes.map((classItem) {
//                                 return DropdownMenuItem(
//                                   value: classItem,
//                                   child: Text(classItem),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Flexible(
//                     child: Container(
//                       height: 40,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         gradient: LinearGradient(
//                           colors: [Color(0xFFA10048), Color(0xFF2300FF)],
//                           stops: [0.0, 1.0],
//                         ),
//                       ),
//                       child: Container(
//                         margin: EdgeInsets.all(1),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.fromLTRB(13, 8, 13, 8),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<String>(
//                               isExpanded: true,
//                               hint: Text('Select Subject'),
//                               value: _selectedSubject,
//                               onChanged: (newValue) {
//                                 setState(() {
//                                   _selectedSubject = newValue;
//                                   _isLoading = true;
//                                   _fetchCourses(); // Fetch courses again when subject changes
//                                 });
//                               },
//                               items: _subjects.map((subjectItem) {
//                                 return DropdownMenuItem(
//                                   value: subjectItem,
//                                   child: Text(subjectItem),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : _errorMessage.isNotEmpty
//                       ? Center(child: Text(_errorMessage))
//                       : _courses.isEmpty
//                           ? Center(child: Text('No courses available'))
//                           : Column(
//                               children: _courses
//                                   .map((course) => CourseCard(course: course))
//                                   .toList(),
//                             ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CourseCard extends StatelessWidget {
//   final Course course;
//
//   CourseCard({required this.course});
//
//   @override
//   Widget build(BuildContext context) {
//     final courseRating = double.tryParse(course.courseRating) ?? 0.0;
//     final teacherRating = double.tryParse(course.teacherRating) ?? 0.0;
//
//     return Column(
//       children: [
//         Container(
//           margin: const EdgeInsets.symmetric(vertical: 0),
//           padding: const EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(4),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 offset: Offset(0, 4),
//                 blurRadius: 10,
//                 spreadRadius: 0,
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 388,
//                 height: 245,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4),
//                   image: DecorationImage(
//                     image: course.courseImage != null
//                         ? NetworkImage(course.courseImage!)
//                         : AssetImage('assets/images/courses.png')
//                             as ImageProvider,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 course.name,
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                   color: Color(0xFF494949),
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 course.description,
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                   color: Color(0xFF818181),
//                 ),
//               ),
//               SizedBox(height: 10),
//               buildInfoRow('Total Chapters', course.totalChapters.toString()),
//               SizedBox(height: 10),
//               buildRatingRow(
//                   'Course Rating', courseRating, course.courseRating),
//               SizedBox(height: 4),
//               SizedBox(
//                   height:
//                       4), // Small gap between the second and third text widgets
//               Container(
//                 width: double.infinity, // Fixed width for the layout container
//                 height: 30, // Fixed height for the layout container
//                 // Padding
//                 padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 96, // Fixed width for the text
//                       height: 17, // Fixed height for the text
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             'assets/icon/courseicon.png', // Image asset path
//                             width: 15, // Image width
//                             height: 15, // Image height
//                           ),
//                           SizedBox(width: 5), // Space between image and text
//                           Text(
//                             'Live Classes', // Text content
//                             style: TextStyle(
//                               fontFamily: 'DM Sans', // Use the DM Sans font
//                               fontWeight: FontWeight.w500, // Font weight 500
//                               fontSize: 12, // Font size 10px
//                               height: 16.8 /
//                                   10, // Line height, calculated based on font size
//                               color: Color(0xFF494949), // Text color
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: 128, // Fixed width for the text
//                       height: 16, // Fixed height for the text
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             'assets/icon/courseicon.png', // Image asset path
//                             width: 15, // Image width
//                             height: 15, // Image height
//                           ),
//                           SizedBox(width: 5), // Space between image and text
//                           Text(
//                             'Recorded Classes', // Text content
//                             style: TextStyle(
//                               fontFamily: 'DM Sans', // Use the DM Sans font
//                               fontWeight: FontWeight.w500, // Font weight 500
//                               fontSize: 12, // Font size 10px
//                               height: 10.8 /
//                                   10, // Line height, calculated based on font size
//                               color: Color(0xFF494949), // Text color
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: 91, // Fixed width for the text
//                       height: 16, // Fixed height for the text
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             'assets/icon/courseicon.png', // Image asset path
//                             width: 15, // Image width
//                             height: 15, // Image height
//                           ),
//                           SizedBox(width: 5), // Space between image and text
//                           Text(
//                             'Mock Tests', // Text content
//                             style: TextStyle(
//                               fontFamily: 'DM Sans', // Use the DM Sans font
//                               fontWeight: FontWeight.w500, // Font weight 500
//                               fontSize: 12, // Font size 10px
//                               height: 10.8 /
//                                   10, // Line height, calculated based on font size
//                               color: Color(0xFF494949), // Text color
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: double.infinity, // Fixed width for the layout container
//                 height: 30, // Fixed height for the layout container
//                 margin: EdgeInsets.fromLTRB(0, 0, 0, 0), // Padding
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Color(0xFFEDEDED),
//                       width: 0.5,
//                     ),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 96, // Fixed width for the text
//                       height: 16, // Fixed height for the text
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             'assets/icon/courseicon.png', // Image asset path
//                             width: 15, // Image width
//                             height: 15, // Image height
//                           ),
//                           SizedBox(width: 4), // Space between image and text
//                           const Text(
//                             'DPP Sheets', // Text content
//                             style: TextStyle(
//                               fontFamily: 'DM Sans', // Use the DM Sans font
//                               fontWeight: FontWeight.w500, // Font weight 500
//                               fontSize: 12, // Font size 10px
//                               height: 16.8 /
//                                   10, // Line height, calculated based on font size
//                               color: Color(0xFF494949), // Text color
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: 128, // Fixed width for the text
//                       height: 16, // Fixed height for the text
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             'assets/icon/courseicon.png', // Image asset path
//                             width: 15, // Image width
//                             height: 15, // Image height
//                           ),
//                           SizedBox(width: 5), // Space between image and text
//                           Text(
//                             'Notes', // Text content
//                             style: TextStyle(
//                               fontFamily: 'DM Sans', // Use the DM Sans font
//                               fontWeight: FontWeight.w500, // Font weight 500
//                               fontSize: 12, // Font size 10px
//                               height: 10.8 /
//                                   10, // Line height, calculated based on font size
//                               color: Color(0xFF494949), // Text color
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: 91, // Fixed width for the text
//                       height: 16, // Fixed height for the text
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             'assets/icon/courseicon.png', // Image asset path
//                             width: 15, // Image width
//                             height: 15, // Image height
//                           ),
//                           SizedBox(width: 5), // Space between image and text
//                           Text(
//                             'MCQs', // Text content
//                             style: TextStyle(
//                               fontFamily: 'DM Sans', // Use the DM Sans font
//                               fontWeight: FontWeight.w500, // Font weight 500
//                               fontSize: 12, // Font size 10px
//                               height: 10.8 /
//                                   10, // Line height, calculated based on font size
//                               color: Color(0xFF494949), // Text color
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               buildTeacherRow(teacherRating, course.teacherName,
//                   course.teacherImage, course.teacherTotalRating),
//             ],
//           ),
//         ),
//         buildPriceRow(course.price),
//       ],
//     );
//   }
//
//   Widget buildInfoRow(String title, String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontFamily: 'DM Sans',
//             fontWeight: FontWeight.w700,
//             fontSize: 14,
//             color: Color(0xFF002ED2),
//           ),
//         ),
//         Text(
//           value,
//           style: TextStyle(
//             fontFamily: 'DM Sans',
//             fontWeight: FontWeight.w700,
//             fontSize: 14,
//             color: Color(0xFF002ED2),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildRatingRow(String title, double rating, String ratingString) {
//     int fullStars = rating.floor();
//     bool hasHalfStar = (rating - fullStars) >= 0.5;
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontFamily: 'DM Sans',
//             fontWeight: FontWeight.w500,
//             fontSize: 15,
//             color: Color(0xFF494949),
//           ),
//         ),
//         Row(
//           children: [
//             for (var i = 0; i < 5; i++)
//               Icon(
//                 i < fullStars
//                     ? Icons.star
//                     : (hasHalfStar && i == fullStars
//                         ? Icons.star_half
//                         : Icons.star_border),
//                 color: Colors.orange,
//                 size: 14,
//               ),
//             SizedBox(width: 5),
//             Text(
//               '$ratingString ($rating)',
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: Color(0xFF494949),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget buildFeatureRow(List<String> features) {
//     return Column(
//       children: [
//         for (int i = 0; i < features.length; i += 2)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               buildFeatureItem(features[i]),
//               if (i + 1 < features.length) buildFeatureItem(features[i + 1]),
//             ],
//           ),
//       ],
//     );
//   }
//
//   Widget buildFeatureItem(String feature) {
//     return Row(
//       children: [
//         Image.asset(
//           'assets/icon/courseicon.png',
//           width: 16,
//           height: 16,
//         ),
//         SizedBox(width: 4),
//         Text(
//           feature,
//           style: TextStyle(
//             fontFamily: 'DM Sans',
//             fontWeight: FontWeight.w500,
//             fontSize: 12,
//             color: Color(0xFF494949),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildTeacherRow(
//       double rating, String name, String imageUrl, int totalRating) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Image.network(
//               imageUrl,
//               width: 32,
//               height: 32,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(width: 8),
//             Text(
//               name,
//               style: TextStyle(
//                 fontFamily: 'DM Sans',
//                 fontWeight: FontWeight.w500,
//                 fontSize: 15,
//                 color: Color(0xFF494949),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             for (var i = 0; i < 5; i++)
//               Icon(
//                 i < rating.floor()
//                     ? Icons.star
//                     : (i < rating ? Icons.star_half : Icons.star_border),
//                 color: Colors.orange,
//                 size: 14,
//               ),
//             SizedBox(width: 5),
//             Text(
//               '$rating ($totalRating)',
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: Color(0xFF494949),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget buildPriceRow(String price) {
//     return Container(
//       width: double.infinity,
//       height: 48,
//       padding: EdgeInsets.zero,
//       decoration: BoxDecoration(
//         color: Color(0xFFF3F3F3),
//         border: Border.all(
//           color: Color(0xFFEDEDED),
//           width: 0.5,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             width: 62,
//             height: 24,
//             margin: EdgeInsets.only(left: 16),
//             child: Center(
//               child: Text(
//                 price,
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w700,
//                   fontSize: 20,
//                   color: Color(0xFF3C3C3C),
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 width: 32,
//                 height: 32,
//                 margin: EdgeInsets.only(left: 75),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(4),
//                   border: Border.all(
//                     color: Color(0xFF1A21BC),
//                     width: 0.5,
//                   ),
//                 ),
//                 child: Image.asset(
//                   'icon/Frame.png',
//                   width: 20,
//                   height: 20,
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 width: 100,
//                 height: 32,
//                 margin: EdgeInsets.only(right: 8),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4),
//                   gradient: LinearGradient(
//                     colors: [Color(0xFFA10048), Color(0xFF2300FF)],
//                     stops: [0.0, 1.0],
//                   ),
//                 ),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Add your onPressed code here
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     shadowColor: Colors.transparent,
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Button',
//                       style: TextStyle(
//                         fontFamily: 'DM Sans',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
// // Sample Course class for context
