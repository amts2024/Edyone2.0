import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Navbar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  TextEditingController _nameController = TextEditingController();
  bool _isEditingName = false;
  bool _showPersonalDetails = true; // Added boolean to toggle content
  Map<String, dynamic>? _userData; // Variable to hold user data

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the widget is initialized
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
            _userData = data['data']; // Store user data in state
            _nameController.text = _userData!['name']; // Set the name
          });
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

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        MaterialPageRoute(
                            builder: (context) =>
                                Navbar()), // Replace with your desired page
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        width: 160.0,
                        height: 160.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 4.0, // Border width
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 76.0,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : _userData != null && _userData!['image'] != null
                                  ? NetworkImage(_userData![
                                      'image']) // Load image from API
                                  : AssetImage("assets/images/banner.png")
                                      as ImageProvider,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: _pickImage,
                            tooltip: 'Upload Image',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          _isEditingName
                              ? Container(
                                  width: 200,
                                  child: TextField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      hintText: 'Student Name',
                                      border: OutlineInputBorder(),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : Text(
                                  _nameController.text.isEmpty
                                      ? 'Student Name'
                                      : _nameController.text,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              _userData != null && _userData!['class'] != null
                                  ? 'Class-${_userData!['class']}' // Display class from API
                                  : 'Class-10', // Default value
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 4),
                      IconButton(
                        icon: Padding(
                          padding: EdgeInsets.only(bottom: 28.0),
                          child: _isEditingName
                              ? Image.asset('assets/images/pen.png')
                              : Image.asset(
                                  'assets/images/pen.png',
                                  color: Colors.black,
                                ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_isEditingName) {
                              // Save logic if needed
                              if (_nameController.text.isEmpty) {
                                _nameController.text = 'Student Name';
                              }
                            }
                            _isEditingName = !_isEditingName;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    height: 40,
                    indent: 20,
                    endIndent: 20,
                  ),
                  // Additional UI elements can go here...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
