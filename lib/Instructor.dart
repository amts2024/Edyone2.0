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
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load teachers');
    }
  }
}

// Gradient Border Dropdown Button
class GradientBorderDropdown extends StatelessWidget {
  final String placeholder;
  final String selectedValue;
  final List<String> dropdownItems;
  final ValueChanged<String?> onDropdownChanged;
  final Color borderColor;

  GradientBorderDropdown({
    required this.placeholder,
    required this.selectedValue,
    required this.dropdownItems,
    required this.onDropdownChanged,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: borderColor, // Set the border color
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: selectedValue.isEmpty ? null : selectedValue,
            items: dropdownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onDropdownChanged,
            icon: Icon(Icons.arrow_drop_down),
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
            dropdownColor: Colors.white, // Background color of dropdown menu
            hint: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                placeholder,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            selectedItemBuilder: (BuildContext context) {
              return dropdownItems.map((String value) {
                return Text(
                  value,
                  style: TextStyle(color: Colors.black),
                );
              }).toList();
            },
          ),
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
        padding: EdgeInsets.all(8.0),
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
              Text(
                username,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(customIconPath, height: 16.0, width: 16.0),
                  SizedBox(width: 4.0),
                  Text(
                    subject,
                    style: TextStyle(fontSize: 12.0, color: Color(0xFF4F4F4F)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Divider(
                height: 22.0,
                thickness: 1.0,
                color: Colors.grey,
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
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Instructor',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: GradientBorderDropdown(
                    placeholder: 'Select Subject',
                    borderColor:
                        Colors.red, // Border color for subject dropdown
                    selectedValue: selectedSubject,
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
                  child: GradientBorderDropdown(
                    placeholder: 'Select Class',
                    borderColor:
                        Colors.green, // Border color for class dropdown
                    selectedValue: selectedClass,
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
            child: FutureBuilder<ApiResponse>(
              future: futureTeachers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final teachers = snapshot.data!.data;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: teachers.length,
                    itemBuilder: (context, index) {
                      final teacher = teachers[index];
                      return UserCard(
                        photoUrl: teacher.image,
                        username: teacher.name,
                        subject: teacher.courseTitle,
                        customIconPath: 'assets/images/image1.png',
                        teacherId: teacher.teacherId,
                      );
                    },
                  );
                } else {
                  return Center(child: Text('No Data Found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
