import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  String? _selectedClass;
  String? _selectedSubject;
  List<Course> _courses = [];
  bool _isLoading = true;

  final List<String> _classes = [
    'Class 1',
    'Class 2',
    'Class 3',
    '4th',
    '5th',
    '6th',
    '7th',
    '8th',
    '9th',
    '10th',
    '11th',
    '12th'
  ];
  final List<String> _subjects = ['Math', 'Science', 'History'];

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    final url = 'https://admin.edyone.site/api/course/get-list';
    final headers = {
      'Authorization': 'Bearer lPpIG4JNsrzakZtGlcxgjiglFVfeWMg8LIX2ydPO',
      'Content-Type': 'application/json'
    };
    final body = jsonEncode(
        {'class': _selectedClass, 'subject': _selectedSubject, 'per_page': 5});

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final courses = (data['data'] as List)
            .map((courseJson) => Course.fromJson(courseJson))
            .toList();
        setState(() {
          _courses = courses;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      // Handle exceptions or errors here
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                  const SizedBox(width: 8),
                  const Text(
                    'Courses',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(13, 8, 13, 8),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('Select Class'),
                              value: _selectedClass,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedClass = newValue;
                                  _fetchCourses(); // Fetch courses again when class changes
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
                  SizedBox(width: 16),
                  Flexible(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(13, 8, 13, 8),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('Select Subject'),
                              value: _selectedSubject,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedSubject = newValue;
                                  _fetchCourses(); // Fetch courses again when subject changes
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
              SizedBox(height: 16),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: _courses
                          .map((course) => CourseCard(course: course))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class Course {
  final int id;
  final String name;
  final String? courseImage;
  final String language;
  final String courseClass;
  final String description;
  final String durationInHours;
  final int totalChapters;
  final String courseRating;
  final int courseTotalRating;
  final String teacherName;
  final String teacherImage;
  final String teacherRating;
  final int teacherTotalRating;
  final String price;

  Course({
    required this.id,
    required this.name,
    this.courseImage,
    required this.language,
    required this.courseClass,
    required this.description,
    required this.durationInHours,
    required this.totalChapters,
    required this.courseRating,
    required this.courseTotalRating,
    required this.teacherName,
    required this.teacherImage,
    required this.teacherRating,
    required this.teacherTotalRating,
    required this.price,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['course_id'],
      name: json['name'],
      courseImage: json['course_image'],
      language: json['language'],
      courseClass: json['class'],
      description: json['description'],
      durationInHours: json['duration_in_hours'],
      totalChapters: json['total_chapters'],
      courseRating: json['course_rating'],
      courseTotalRating: json['course_total_rating'],
      teacherName: json['teacher_name'],
      teacherImage: json['teacher_image'],
      teacherRating: json['teacher_rating'],
      teacherTotalRating: json['teacher_total_rating'],
      price: json['price'],
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;

  CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 245,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: course.courseImage != null
                    ? NetworkImage(course.courseImage!)
                    : AssetImage('assets/images/courses.png') as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            course.name,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFF494949),
            ),
          ),
          SizedBox(height: 4),
          Text(
            course.description,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF818181),
            ),
          ),
          SizedBox(
            height: 10,
          ), // Small gap between the second and third text widgets
          Container(
            width: double.infinity, // Fixed width for the layout container
            height: 17, // Fixed height for the layout container
            padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space between items
              children: [
                Container(
                  width: 99, // Fixed width for the third text
                  height: 17, // Fixed height for the third text
                  child: Text(
                    'Total Chapters', // Third text content
                    style: TextStyle(
                      fontFamily: 'DM Sans', // Use the DM Sans font
                      fontWeight: FontWeight.w700, // Font weight 700
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
                    course.totalChapters.toString(), // Number text content
                    style: TextStyle(
                      fontFamily: 'DM Sans', // Use the DM Sans font
                      fontWeight: FontWeight.w700, // Font weight 700
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
            width: double.infinity, // Fixed width for the layout container
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
                      fontWeight: FontWeight.w500, // Font weight 700
                      fontSize: 15, // Font size 14px
                      height: 16.8 /
                          14, // Line height, calculated based on font size
                      color: Color(0xFF494949), // Text color
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (var i = 0; i < 4; i++)
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 14,
                      ),
                    Stack(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.grey.withOpacity(0.5),
                          size: 14,
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${course.courseRating} (${course.courseRating})',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF494949),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
              height: 4), // Small gap between the second and third text widgets
          Container(
            width: double.infinity, // Fixed width for the layout container
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
                        'assets/icon/courseicon.png', // Image asset path
                        width: 16, // Image width
                        height: 16, // Image height
                      ),
                      SizedBox(width: 4), // Space between image and text
                      Text(
                        'Live Classes', // Text content
                        style: TextStyle(
                          fontFamily: 'DM Sans', // Use the DM Sans font
                          fontWeight: FontWeight.w500, // Font weight 500
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
                        'assets/icon/courseicon.png', // Image asset path
                        width: 16, // Image width
                        height: 16, // Image height
                      ),
                      SizedBox(width: 4), // Space between image and text
                      Text(
                        'Recorded Classes', // Text content
                        style: TextStyle(
                          fontFamily: 'DM Sans', // Use the DM Sans font
                          fontWeight: FontWeight.w500, // Font weight 500
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
                        'assets/icon/courseicon.png', // Image asset path
                        width: 16, // Image width
                        height: 16, // Image height
                      ),
                      SizedBox(width: 4), // Space between image and text
                      Text(
                        'Mock Tests', // Text content
                        style: TextStyle(
                          fontFamily: 'DM Sans', // Use the DM Sans font
                          fontWeight: FontWeight.w500, // Font weight 500
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
            width: double.infinity, // Fixed width for the layout container
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
                        'assets/icon/courseicon.png', // Image asset path
                        width: 16, // Image width
                        height: 16, // Image height
                      ),
                      SizedBox(width: 4), // Space between image and text
                      Text(
                        'DPP Sheets', // Text content
                        style: TextStyle(
                          fontFamily: 'DM Sans', // Use the DM Sans font
                          fontWeight: FontWeight.w500, // Font weight 500
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
                        'assets/icon/courseicon.png', // Image asset path
                        width: 16, // Image width
                        height: 16, // Image height
                      ),
                      SizedBox(width: 4), // Space between image and text
                      Text(
                        'Notes', // Text content
                        style: TextStyle(
                          fontFamily: 'DM Sans', // Use the DM Sans font
                          fontWeight: FontWeight.w500, // Font weight 500
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
                        'assets/icon/courseicon.png', // Image asset path
                        width: 16, // Image width
                        height: 16, // Image height
                      ),
                      SizedBox(width: 8), // Space between image and text
                      Text(
                        'MCQs', // Text content
                        style: TextStyle(
                          fontFamily: 'DM Sans', // Use the DM Sans font
                          fontWeight: FontWeight.w500, // Font weight 500
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network(
                    course.teacherImage,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
                  Text(
                    course.teacherName,
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xFF494949),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  for (var i = 0; i < 4; i++)
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 14,
                    ),
                  Stack(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.grey.withOpacity(0.5),
                        size: 14,
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${course.teacherRating} (${course.teacherTotalRating})',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFF494949),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 48,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Color(0xFFF3F3F3),
              border: Border.all(
                color: Color(0xFFEDEDED),
                width: 0.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 62,
                  height: 24,
                  margin: EdgeInsets.only(left: 16),
                  child: Center(
                    child: Text(
                      course.price,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xFF3C3C3C),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  margin: EdgeInsets.only(left: 80),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Color(0xFF1A21BC),
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    'icon/Frame.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                Container(
                  width: 100,
                  height: 32,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      colors: [Color(0xFFA10048), Color(0xFF2300FF)],
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
                    child: Center(
                      child: Text(
                        'Button',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
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
