import 'package:flutter/material.dart';
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
                                Navbar()), // Replace YourPage with your desired page
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
                          radius: 76.0, // 80 - 4 (border width)
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : AssetImage("images/banner.png")
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
                          SizedBox(
                              height:
                                  8), // Add some space between the two texts
                          Padding(
                            padding: const EdgeInsets.only(
                                left:
                                    20.0), // You can adjust the padding value as needed
                            child: Text(
                              'Class-10',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .black, // You can adjust color as needed
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                          width:
                              4), // Add some space between the text and the icon
                      IconButton(
                        icon: Padding(
                          padding: EdgeInsets.only(
                              bottom: 28.0), // Add padding to the bottom
                          child: _isEditingName
                              ? Image.asset('images/pen.png')
                              : Image.asset(
                                  'images/pen.png',
                                  color: Colors.black,
                                ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_isEditingName) {
                              // Perform save operation if needed
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
                                    Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                                  ),
                              ),
                            ),
                            Container(
                              height: 4,
                              width: 170,
                              decoration: BoxDecoration(
                                gradient: _showPersonalDetails
                                    ? LinearGradient(
                                        colors: [
                                          Color(0xFFA10048),
                                          Color(0xFF2300FF)
                                        ],
                                      )
                                    : LinearGradient(
                                        colors: [Colors.grey, Colors.grey],
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
                              'My Purchase',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: !_showPersonalDetails
                                        ? [Color(0xFFA10048), Color(0xFF2300FF)]
                                        : [Colors.black, Colors.black],
                                  ).createShader(
                                    Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                                  ),
                              ),
                            ),
                            Container(
                              height: 4,
                              width: 170,
                              decoration: BoxDecoration(
                                gradient: !_showPersonalDetails
                                    ? LinearGradient(
                                        colors: [
                                          Color(0xFFA10048),
                                          Color(0xFF2300FF)
                                        ],
                                      )
                                    : LinearGradient(
                                        colors: [Colors.grey, Colors.grey],
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _showPersonalDetails
                      ? PersonalDetailsPage()
                      : PurchaseHistoryPage(), // Conditionally show content based on the selected tab
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0,
                  top: 18.0), // Add left and top padding to the calendar logo
              child: Image.asset(
                'images/calender.png',
                width: 24,
                height: 24,
                color: Colors.black,
              ), // Custom calendar icon
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 18.0), // Add left and top padding to the text "Calendar"
              child: Text('Calendar'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 28.0, bottom: 10.0), // Add padding to the TextFormField
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    '22 July 2002' // Add other InputDecoration properties as needed
                ),
          ),
        ),
        // Add other form fields here...

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0), // Add left and top padding to the Gmail logo
              child: Image.asset(
                'images/sex.png',
                width: 24,
                height: 24,
                color: Colors.black,
              ), // Custom calendar icon
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ), // Add left and top padding to the text "Gmail"
              child: Text('Gender'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 28.0,
          ), // Add padding to the TextFormField for Gmail
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    'Male' // Add other InputDecoration properties as needed
                ),
          ),
        ),

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
              ), // Add left and top padding to the Gmail logo
              child: Image.asset(
                'images/email.png',
                width: 24,
                height: 24,
                color: Colors.black,
              ), // Custom calendar icon
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ), // Add left and top padding to the text "Gmail"
              child: Text('Email ID'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 28.0,
          ), // Add padding to the TextFormField for Gmail
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText:
                  'example@gmail.com', // Add other InputDecoration properties as needed
            ),
          ),
        ),

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
              ), // Add left and top padding to the Gmail logo
              child: Image.asset(
                'images/mobile.png',
                width: 24,
                height: 24,
                color: Colors.black,
              ), // Custom calendar icon
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ), // Add left and top padding to the text "Gmail"
              child: Text('Mobile Number'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 28.0,
          ), // Add padding to the TextFormField for Gmail
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    '+91 956852 956852' // Add other InputDecoration properties as needed
                ),
          ),
        ),

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
              ), // Add left and top padding to the Gmail logo
              child: Image.asset(
                'images/adr.png',
                width: 24,
                height: 24,
                color: Colors.black,
              ), // Custom calendar icon
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ), // Add left and top padding to the text "Gmail"
              child: Text('Address'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 28.0,
          ), // Add padding to the TextFormField for Gmail
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    'A-76, Sector 45, Noida, Uttar Pradesh Near Rockwell Building, 201301' // Add other InputDecoration properties as needed
                ),
          ),
        ),

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
              ), // Add left and top padding to the Gmail logo
              child: Image.asset(
                'images/edu.png',
                width: 24,
                height: 24,
                color: Colors.black,
              ), // Custom calendar icon
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ), // Add left and top padding to the text "Gmail"
              child: Text('Education State '),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 28.0,
          ), // Add padding to the TextFormField for Gmail
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    'Uttar Pradesh' // Add other InputDecoration properties as needed
                ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
              ), // Add left and top padding to the Gmail logo
              child: Image.asset(
                'images/edb.png',
                width: 24,
                height: 24,
                color: Colors.black,
              ), // Custom calendar icon
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ), // Add left and top padding to the text "Gmail"
              child: Text('Education Board'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 28.0,
          ), // Add padding to the TextFormField for Gmail
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    'U.P. Board' // Add other InputDecoration properties as needed
                ),
          ),
        ),

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
              ), // Add left and top padding to the Gmail logo
              child: Image.asset(
                'images/training.png',
                width: 24,
                height: 24,
                color: Colors.black,
              ), // Custom calendar icon
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ), // Add left and top padding to the text "Gmail"
              child: Text('Standard/Class'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 28.0,
          ), // Add padding to the TextFormField for Gmail
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    'Class-10' // Add other InputDecoration properties as needed
                ),
          ),
        ),

        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0), // Add bottom padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 187,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement edit profile functionality
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFA10048),
                          Color(0xFF2300FF),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      // No borderRadius for rectangle button
                    ),
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 187,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement reset password functionality
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFA10048),
                          Color(0xFF2300FF),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      // No borderRadius for rectangle button
                    ),
                    child: Center(
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PurchaseHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // Add your purchase history UI here...
        );
  }
}
