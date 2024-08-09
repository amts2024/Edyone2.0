import 'package:edyon/Navbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../About_us.dart';
import '../Instructor.dart';
import '../privacy_policy.dart';
import '../terms_page.dart';
import '../wallet.dart';

class SideMenuBar extends StatefulWidget {
  final Function(int) onItemTapped;

  SideMenuBar({required this.onItemTapped});

  @override
  _SideMenuBarState createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<SideMenuBar> {
  int _selectedIndex = 0; // To keep track of the selected item

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white, // Ensure the header background is white
                border: Border(
                  bottom: BorderSide(
                      color: Colors.transparent), // Remove the bottom border
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 8.0, left: 16.0, right: 16.0), // Add padding
                  child: Image.asset(
                    'images/header.png',
                    height: 60, // Set the height of the image
                    width: 220, // Set the width of the image
                    fit: BoxFit.cover, // Adjust this as necessary
                  ),
                ),
              ),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('icon/housebold.png'), // Custom icon image for Home
                size: 24, // Icon size
                color: Color(0xFF5E5EEA), // Icon color
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF5E5EEA), // Set font color
                ),
              ),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage(
                    'icon/referarrow.png'), // Custom icon image for Refer & Earn
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Refer-arr',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              // onTap: () => (1),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('icon/walletup.png'), // Custom icon image for Wallet
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Wallet',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Wallet()), // Navigate to the external InstructorPage
                );
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage(
                    'icon/calendar-days.png'), // Custom icon image for Calendar
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Calendar',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              //onTap: () => _onItemTapped(3),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('icon/chalkboard-user.png'),
                size: 24,
                color: Colors.black,
              ),
              title: Text(
                'Instructor',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyWidget()), // Navigate to the external InstructorPage
                );
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('icon/play.png'), // Custom icon image for Courses
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Videos',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              // onTap: () => CoursesPage(),
            ),
            // ListTile(
            //   leading: ImageIcon(
            //     AssetImage('icon/video.png'), // Custom icon image for Videos
            //     size: 24, // Icon size
            //     color: Colors.black, // Icon color
            //   ),
            //   title: Text(
            //     'Videos',
            //     style: TextStyle(
            //       fontFamily: 'Roboto', // Use the custom Poppins font
            //       fontSize: 14.0, // Set font size
            //       color: Color(0xFF696969), // Set font color
            //     ),
            //   ),
            //   // onTap: () => _onItemTapped(6),
            // ),
            ListTile(
              leading: ImageIcon(
                AssetImage('icon/choose.png'), // Custom icon image for MCQ
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'MCQ',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              // onTap: () => _onItemTapped(7),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('icon/images-user.png'), // Custom icon image for DPP
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'DPPs',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              // onTap: () => _onItemTapped(8),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('icon/web-test.png'), // Custom icon image for Tests
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Tests',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              // onTap: () => _onItemTapped(9),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage(
                    'icon/journal-alt.png'), // Custom icon image for Notes
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Notes',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              // onTap: () => _onItemTapped(10),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage(
                    'icon/book-open-cover.png'), // Custom icon image for Books
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Books',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              // onTap: () => _onItemTapped(11),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('icon/info.png'), // Custom icon image for About Us
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'About Us',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AboutUs()), // Navigate to the external InstructorPage
                );
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage(
                    'icon/compliance-document.png'), // Custom icon image for Privacy Policy
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PrivacyPolicy()), // Navigate to the external InstructorPage
                );
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage(
                    'icon/condition.png'), // Custom icon image for Terms & Conditions
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Terms & Conditions',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TermsAndConditions()), // Navigate to the external InstructorPage
                );
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage(
                    'icon/messages-question.png'), // Custom icon image for FAQs
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'FAQs',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              // onTap: () => _onItemTapped(15),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage(
                    'icon/feedback-review.png'), // Custom icon image for Follow Us
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Rate App',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              // onTap: () => _onItemTapped(16),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage(
                    'icon/followcollection.png'), // Custom icon image for Follow Us
                size: 24, // Icon size
                color: Colors.black, // Icon color
              ),
              title: Text(
                'Follow Us',
                style: TextStyle(
                  fontFamily: 'Roboto', // Use the custom Poppins font
                  fontSize: 14.0, // Set font size
                  color: Color(0xFF696969), // Set font color
                ),
              ),
              // onTap: () => _onItemTapped(16),
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0), // Add left padding to the divider
              child: Divider(color: Colors.grey),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14.0,
                  color: Color(0xFF696969),
                ),
              ),
              onTap: () async {
                // Clear the user data from SharedPreferences
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();

                // Navigate to the SignInPage
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemTapped(index);
  }

  Widget _createDrawerItem({
    required int index,
    required String icon,
    required String boldIcon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    final bool isSelected = _selectedIndex == index;

    return ListTile(
      leading: Image.asset(
        isSelected ? boldIcon : icon,
        width: 24,
        height: 24,
        color: isSelected ? Color(0xFF5E5EEA) : Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14.0,
          color: isSelected ? Color(0xFF5E5EEA) : Color(0xFF696969),
        ),
      ),
      onTap: onTap,
    );
  }
}
