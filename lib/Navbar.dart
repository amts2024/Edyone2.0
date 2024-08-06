import 'package:edyon/splash1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Instructor.dart';
import 'wallet.dart';
import 'terms_page.dart';
import 'privacy_policy.dart';
import 'About_us.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ReferEarnPage(),
    WalletPage(),
    CalendarPage(),
    //InstructorPage(),
    CoursesPage(),
    VideosPage(),
    MCQPage(),
    DPPPage(),
    TestsPage(),
    NotesPage(),
    BooksPage(),
    AboutUsPage(),
    PrivacyPolicyPage(),
    TermsConditionsPage(),
    FAQsPage(),
    FollowUsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Close the drawer when an item is tapped
    });
  }

  void _logout() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: ImageIcon(
              AssetImage('icon/menu.png'), // Your custom drawer menu icon
              color: Color(0xFF454545), // Icon color
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: ImageIcon(
              AssetImage('icon/shop_cart.png'), // Your notification icon image
              color: Color(0xFF454545), // Icon color
            ),
            onPressed: () {
              // Add your notification icon functionality here
            },
          ),
          IconButton(
            icon: ImageIcon(
              AssetImage('icon/bell.png'), // Your settings icon image
              color: Color(0xFF454545), // Icon color
            ),
            onPressed: () {
              // Add your settings icon functionality here
            },
          ),
          IconButton(
            icon: ImageIcon(
              AssetImage('icon/profile.png'), // Your search icon image
              color: Color(0xFF454545), // Icon color
            ),
            onPressed: () {
              // Add your search icon functionality here
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white, // Set the background color for the entire drawer
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
              Padding(
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0), // Add left padding to the divider
                child: Divider(color: Colors.grey),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage('icon/home.png'), // Custom icon image for Home
                  size: 24, // Icon size
                  color: Colors.black, // Icon color
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Roboto', // Use the custom Poppins font
                    fontSize: 14.0, // Set font size
                    color: Color(0xFF696969), // Set font color
                  ),
                ),
                onTap: () => _onItemTapped(0),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage(
                      'icon/refer.png'), // Custom icon image for Refer & Earn
                  size: 24, // Icon size
                  color: Colors.black, // Icon color
                ),
                title: Text(
                  'Refer & Earn',
                  style: TextStyle(
                    fontFamily: 'Roboto', // Use the custom Poppins font
                    fontSize: 14.0, // Set font size
                    color: Color(0xFF696969), // Set font color
                  ),
                ),
                onTap: () => _onItemTapped(1),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage('icon/wallet.png'), // Custom icon image for Wallet
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
                  AssetImage('icon/date.png'), // Custom icon image for Calendar
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
                  AssetImage('icon/instrutor.png'),
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
                  AssetImage(
                      'icon/courses.png'), // Custom icon image for Courses
                  size: 24, // Icon size
                  color: Colors.black, // Icon color
                ),
                title: Text(
                  'Courses',
                  style: TextStyle(
                    fontFamily: 'Roboto', // Use the custom Poppins font
                    fontSize: 14.0, // Set font size
                    color: Color(0xFF696969), // Set font color
                  ),
                ),
                onTap: () => _onItemTapped(5),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage('icon/video.png'), // Custom icon image for Videos
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
                onTap: () => _onItemTapped(6),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage('icon/mcq.png'), // Custom icon image for MCQ
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
                onTap: () => _onItemTapped(7),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage('icon/dpp.png'), // Custom icon image for DPP
                  size: 24, // Icon size
                  color: Colors.black, // Icon color
                ),
                title: Text(
                  'DPP',
                  style: TextStyle(
                    fontFamily: 'Roboto', // Use the custom Poppins font
                    fontSize: 14.0, // Set font size
                    color: Color(0xFF696969), // Set font color
                  ),
                ),
                onTap: () => _onItemTapped(8),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage('icon/testys.png'), // Custom icon image for Tests
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
                onTap: () => _onItemTapped(9),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage('icon/notes.png'), // Custom icon image for Notes
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
                onTap: () => _onItemTapped(10),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage('icon/books.png'), // Custom icon image for Books
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
                onTap: () => _onItemTapped(11),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage(
                      'icon/about.png'), // Custom icon image for About Us
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
                      'icon/privacy.png'), // Custom icon image for Privacy Policy
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
                      'icon/terma.png'), // Custom icon image for Terms & Conditions
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
                  AssetImage('icon/faq.png'), // Custom icon image for FAQs
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
                onTap: () => _onItemTapped(15),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage(
                      'icon/follow.png'), // Custom icon image for Follow Us
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
                onTap: () => _onItemTapped(16),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage('icon/rate.png'), // Custom icon image for Rate Us
                  size: 24, // Icon size
                  color: Colors.black, // Icon color
                ), // Icon size/ Icon for Rate Us
                title: Text(
                  'Rate Us',
                  style: TextStyle(
                    fontFamily: 'Roboto', // Use the custom Poppins font
                    fontSize: 14.0, // Set font size
                    color: Color(0xFF696969), // Set font color
                  ),
                ),
                onTap: () {
                  _onItemTapped(17); // Open the Rate Us page
                },
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
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.clear();

                  // Navigate to the login screen
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), // Adjust the radius as needed
            topRight: Radius.circular(20.0), // Adjust the radius as needed
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), // Adjust the radius as needed
            topRight: Radius.circular(20.0), // Adjust the radius as needed
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('icon/home.png'), // Your custom home icon
                  size: 24, // Icon size
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('icon/home.png'), // Your custom refer icon
                  size: 24, // Icon size
                ),
                label: 'Refer & Earn',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('icon/home.png'), // Your custom wallet icon
                  size: 24, // Icon size
                ),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('icon/home.png'), // Your custom calendar icon
                  size: 24, // Icon size
                ),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('icon/home.png'), // Your custom instructor icon
                  size: 24, // Icon size
                ),
                label: 'Instructor',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            backgroundColor: Colors.white, // Set background color if needed
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<String> _bannerImages = [
    'images/banner.png',
    'images/banner.png',
    'images/banner.png',
    'images/banner.png',
    'images/banner.png',
    'images/banner.png',
    'images/banner.png',
    'images/banner.png',
  ];

  @override
  void initState() {
    super.initState();
    // Start the timer when the page is initialized
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _bannerImages.length + 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Page'),
      // ),
      body: ListView(
        children: [
          // Search Bar
          Container(
            height: 60, // Set the height of the search bar container
            padding: const EdgeInsets.all(7.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          SizedBox(
              height:
                  12), // Add some space between the search bar and the banner slider

          // Banner Image Slider with PageView
          Container(
            height: 200, // Adjust the height as needed
            child: PageView.builder(
              controller: _pageController,
              itemCount: _bannerImages.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    _bannerImages[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),

          SizedBox(
              height:
                  6), // Add some space between the banner image slider and other content

          // Page Indicator
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _bannerImages.map((String url) {
                int index = _bannerImages.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2.0),
                    color:
                        _currentPage == index ? Colors.grey : Color(0xFF1A21BC),
                  ),
                );
              }).toList(),
            ),
          ),

          SizedBox(
              height:
                  12), // Add some space between the slider indicator and other content

          // Other content of the home page
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome to Home Page',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Add more content here...
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReferEarnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Refer & Earn Page'),
    );
  }
}

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Wallet Page'),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Calendar Page'),
    );
  }
}

class InstructorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Instructor Page'),
    );
  }
}

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Courses Page'),
    );
  }
}

class VideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Videos Page'),
    );
  }
}

class MCQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('MCQ Page'),
    );
  }
}

class DPPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('DPP Page'),
    );
  }
}

class TestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tests Page'),
    );
  }
}

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notes Page'),
    );
  }
}

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Books Page'),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('About Us Page'),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  // New SharePage widget
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('PrivacyPolicy Page'),
    );
  }
}

class TermsConditionsPage extends StatelessWidget {
  // New SharePage widget
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('TermsConditions Page'),
    );
  }
}

class FAQsPage extends StatelessWidget {
  // New SharePage widget
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('FAQs Page'),
    );
  }
}

class FollowUsPage extends StatelessWidget {
  // New SharePage widget
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('FollowUs Page'),
    );
  }
}
