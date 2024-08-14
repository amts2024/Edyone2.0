import 'package:flutter/material.dart';


class MoreFree extends StatefulWidget {
  @override
  _MoreFreeState createState() => _MoreFreeState();
}

class _MoreFreeState extends State<MoreFree> {
  String selectedContainer = 'Change Password'; // Initially selected containe
  void selectContainer(String containerName) {
    setState(() {
      selectedContainer = containerName;
    });
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
                    'More',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10), // Space between header and profile image
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    // Profile Image
                    Container(
                      width: 150, // Profile image width
                      height: 150, // Profile image height
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('icon/file.png'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Edit Button

                  ],
                ),
              ),
              const SizedBox(height: 5), // Space between profile image and text
              const Text(
                'Student Name',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 24 / 18, // Reduced line height
                  letterSpacing: 0.01,
                  color: Color(0xFF0B121F),
                ),
              ),
              const SizedBox(height: 2), // Reduced space between "Student Name" and "Class-10"
              const Text(
                'Class-10',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 18 / 14, // Reduced line height
                  letterSpacing: 0.01,
                  color: Color(0xFF70747E),
                ),
              ),

              const SizedBox(height: 30), // Space between text and new section
              Container(
                width: 388, // Set the width of the line
                height: 0, // Set height to 0 to create a horizontal line
                padding: EdgeInsets.symmetric(vertical: 10), // Vertical padding only
                margin: EdgeInsets.only(left: 20, right: 20), // Add space to the left and right
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1, // Set the thickness of the line
                      color: Colors.black.withOpacity(0.2), // Set the color and opacity of the line
                    ),
                  ),
                ),
              ),


              Positioned(
                top: 356, // Position from the top

                child: Container(
                  width: 316, // Fixed width


                  padding: EdgeInsets.only(top: 16), // Optional: inner padding
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0), // Set opacity to 0 for full transparency
                    // Add other decoration properties if needed
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Allows the column to hug its content
                    children: [
                      Column(
                        children: [
                          buildContainer(
                            title: 'Change Password',
                            icon: 'icon/cp.png',
                            isSelected: selectedContainer == 'Change Password',
                            onTap: () => selectContainer('Change Password'),
                          ),
                          const SizedBox(height: 10),
                          buildContainer(
                            title: 'Biometric Login',
                            icon: 'icon/biomatric.png',
                            isSelected: selectedContainer == 'Biometric Login',
                            onTap: () => selectContainer('Biometric Login'),
                          ),
                          const SizedBox(height: 10),
                          buildContainer(
                            title: 'Address',
                            icon: 'icon/add.png',
                            isSelected: selectedContainer == 'Address',
                            onTap: () => selectContainer('Address'),
                          ),
                          const SizedBox(height: 10),
                          buildContainer(
                            title: 'Syllabus',
                            icon: 'icon/syallabus.png',
                            isSelected: selectedContainer == 'Syllabus',
                            onTap: () => selectContainer('Syllabus'),
                          ),
                          const SizedBox(height: 10),
                          buildContainer(
                            title: 'Bank Details',
                            icon: 'icon/bd.png',
                            isSelected: selectedContainer == 'Bank Details',
                            onTap: () => selectContainer('Bank Details'),
                          ),
                          const SizedBox(height: 10),
                          buildContainer(
                            title: 'Contact Us',
                            icon: 'icon/contact.png',
                            isSelected: selectedContainer == 'Contact Us',
                            onTap: () => selectContainer('Contact Us'),
                          ),
                          const SizedBox(height: 10),
                          buildContainer(
                            title: 'Features',
                            icon: 'icon/features.png',
                            isSelected: selectedContainer == 'Features',
                            onTap: () => selectContainer('Features'),
                          ),
                        ],
                      )


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

Widget buildContainer({
  required String title,
  required String icon,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 316, // Container width
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Padding
      constraints: BoxConstraints(
        maxHeight: 37, // Hug height (37px)
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 3, // Border-left width (3px)
            color: isSelected ? Color(0xFF5E5EEA) : Colors.transparent, // Conditional border color
          ),
        ),
        color: Colors.transparent, // Transparent background
      ),
      child: Row(
        children: [
          Container(
            width: 16, // Image width (16px)
            height: 16, // Image height (16px)
            child: Image.asset(
              icon, // Replace with your image asset
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 16), // Gap of 16px between image and text
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins', // Font family
              fontSize: 14, // Font size (14px)
              fontWeight: FontWeight.w500, // Font weight (500)
              height: 16.8 / 14, // Line height (16.8px)
              color: isSelected ? Color(0xFF5E5EEA) : Color(0xFF696969), // Conditional text color
            ),
          ),
        ],
      ),
    ),
  );
}


