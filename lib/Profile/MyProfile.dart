import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'Personaldetails.dart';
import 'UpdateDetails.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _isEditingName = false;
  bool _showPersonalDetails = true;
  File? _image;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final url = Uri.parse('https://admin.edyone.site/api/student/get-data');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer fKlw0WyyLhFDZCCuwfKBBlWaREbcj8yn8xPWrVsS',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status']) {
          setState(() {
            _userData = data['data'];
          });
          print("User data loaded successfully");
        } else {
          throw Exception('Failed to load user data');
        }
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      print("Image selected: ${pickedFile.path}");
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 16, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    'My Profile',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    // Profile Image Widget
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: _image != null
                              ? FileImage(_image!)
                              : _userData != null &&
                                      _userData!['image'] != null &&
                                      _userData!['image'].isNotEmpty
                                  ? NetworkImage(_userData!['image'])
                                      as ImageProvider
                                  : const AssetImage(
                                      'assets/images/banner.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: _image == null &&
                              (_userData == null ||
                                  _userData!['image'] == null ||
                                  _userData!['image'].isEmpty)
                          ? Center(
                              child: Icon(
                                Icons.person,
                                size: 80,
                                color: Colors.grey[400],
                              ),
                            )
                          : null,
                    ),

                    // Edit Button
                    Positioned(
                      top: 12,
                      right: -100,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                'Edit',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.edit, color: Colors.white, size: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                _userData != null && _userData!['name'] != null
                    ? _userData!['name']
                    : 'Student Name',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 24 / 18,
                  letterSpacing: 0.01,
                  color: Color(0xFF0B121F),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                _userData != null && _userData!['class'] != null
                    ? 'Class-${_userData!['class']}'
                    : 'Class-10',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 18 / 14,
                  letterSpacing: 0.01,
                  color: Color(0xFF70747E),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPersonalDetails = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Personal Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: _showPersonalDetails
                                    ? [Color(0xFFA10048), Color(0xFF2300FF)]
                                    : [Colors.black, Colors.black],
                              ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                              ),
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 170,
                          decoration: BoxDecoration(
                            gradient: _showPersonalDetails
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFFA10048),
                                      Color(0xFF2300FF)
                                    ],
                                  )
                                : const LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPersonalDetails = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Update Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: !_showPersonalDetails
                                    ? [Color(0xFFA10048), Color(0xFF2300FF)]
                                    : [Colors.black, Colors.black],
                              ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                              ),
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 170,
                          decoration: BoxDecoration(
                            gradient: !_showPersonalDetails
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFFA10048),
                                      Color(0xFF2300FF)
                                    ],
                                  )
                                : const LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _showPersonalDetails ? PersonalDetails() : UpdateDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
