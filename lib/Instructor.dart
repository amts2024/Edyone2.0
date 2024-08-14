import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Instructor_deatails.dart';

// Model Classes
class Teacher {
  final int teacherId;
  final String name;
  final String image;
  final String courseTitle;

  Teacher({
    required this.teacherId,
    required this.name,
    required this.image,
    required this.courseTitle,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      teacherId: json['teacher_id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      courseTitle: json['course_title'] ?? '',
    );
  }

  static List<Teacher> listFromJson(List<dynamic> json) {
    return json.map((data) => Teacher.fromJson(data)).toList();
  }
}

class ApiResponse {
  final String message;
  final bool status;
  final List<Teacher> data;

  ApiResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? false,
      data: Teacher.listFromJson(json['data'] ?? []),
    );
  }
}

// API Service
class ApiService {
  static const String _baseUrl =
      'https://admin.edyone.site/api/teacher/get-list';
  static const String _token = 'hCSJk41yEtchDa4JH8HLtLVj5hOxDXpq1ycIuggn';

  Future<ApiResponse> fetchTeachers({
    String subject = '',
    int perPage = 10,
    required String className,
  }) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'subject': subject,
        'class': className,
        'per_page': perPage,
      }),
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load teachers');
    }
  }
}

// Gradient Border TextField Widget
class GradientBorderPainter extends CustomPainter {
  final Gradient gradient;
  final double strokeWidth;
  final double radius;

  GradientBorderPainter({
    required this.gradient,
    this.strokeWidth = 2.0,
    this.radius = 7.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class GradientBorderTextField extends StatelessWidget {
  final Gradient gradient;
  final double strokeWidth;
  final double radius;
  final String hintText;
  final List<String> dropdownItems;
  final ValueChanged<String?> onDropdownChanged;

  GradientBorderTextField({
    required this.gradient,
    this.strokeWidth = 2.0,
    this.radius = 7.0,
    required this.hintText,
    required this.dropdownItems,
    required this.onDropdownChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(
        gradient: gradient,
        strokeWidth: strokeWidth,
        radius: radius,
      ),
      child: Container(
        padding: EdgeInsets.all(strokeWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                ),
              ),
            ),
            Container(
              width: 120.0,
              height: 40.0,
              child: DropdownButton<String>(
                icon: Icon(Icons.arrow_drop_down),
                isExpanded: true,
                underline: SizedBox(),
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onDropdownChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// UserCard Widget
class UserCard extends StatelessWidget {
  final String photoUrl;
  final String username;
  final String subject;
  final String customIconPath;
  final int teacherId;

  UserCard({
    required this.photoUrl,
    required this.username,
    required this.subject,
    required this.customIconPath,
    required this.teacherId,
  });

  @override
  Widget build(BuildContext context) {
    print('UserCard: teacherId=$teacherId, username=$username');

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              teacherId: teacherId,
            ),
          ),
        );
      },
      child: Container(
        width: 187,
        height: 190,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFA10048).withOpacity(0.15),
                  Color(0xFF2300FF).withOpacity(0.15),
                ],
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: CircleAvatar(
                      radius: 27.0,
                      backgroundImage: NetworkImage(photoUrl),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.0),
                    child: Text(
                      username,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(customIconPath, height: 16.0, width: 16.0),
                      SizedBox(width: 4.0),
                      Text(
                        subject,
                        style:
                            TextStyle(fontSize: 12.0, color: Color(0xFF4F4F4F)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: Divider(
                      height: 22.0,
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/image1.png',
                        height: 16.0,
                        width: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '5 Courses',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Main Widget
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Future<ApiResponse> futureTeachers;
  String selectedSubject = '';
  String selectedClass = '';

  @override
  void initState() {
    super.initState();
    futureTeachers = ApiService().fetchTeachers(className: '');
  }

  void fetchTeachers() {
    setState(() {
      futureTeachers = ApiService().fetchTeachers(
        subject: selectedSubject,
        className: selectedClass,
        perPage: 10,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 8, 16, 0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Navbar()),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Instructor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: GradientBorderTextField(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    hintText: 'Select Subject',
                    dropdownItems: [
                      'Math',
                      'Science',
                      'English',
                      'Flutter',
                    ],
                    onDropdownChanged: (newValue) {
                      setState(() {
                        selectedSubject = newValue ?? '';
                      });
                      fetchTeachers();
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: GradientBorderTextField(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    hintText: 'Select Class',
                    dropdownItems: [
                      '4th',
                      '5th',
                      '6th',
                      '7th',
                    ],
                    onDropdownChanged: (newValue) {
                      setState(() {
                        selectedClass = newValue ?? '';
                      });
                      fetchTeachers();
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: FutureBuilder<ApiResponse>(
                future: futureTeachers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 187 / 190,
                      ),
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        return UserCard(
                          photoUrl: snapshot.data!.data[index].image,
                          username: snapshot.data!.data[index].name,
                          subject: snapshot.data!.data[index].courseTitle,
                          customIconPath: 'assets/images/image1.png',
                          teacherId: snapshot.data!.data[index].teacherId,
                        );
                      },
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Navbar Placeholder')),
    );
  }
}
