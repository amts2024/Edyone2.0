import 'package:edyon/splash1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'Batches/Batch.dart';
import 'Course/courses.dart';
import 'Instructor.dart';
import 'Learning&Center.dart';
import 'Paid_pages/paid_sidebar.dart';
import 'Profile/More_Free.dart';
import 'Unitle_pages/bottom_navbar.dart';
import 'Unitle_pages/side_menubar.dart';
import 'Unitle_pages/top_navbar.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CoursesScreen(),
    LearningCenter(),
    BatchScreen(),
    MoreFree(),
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
    });
  }

  void _login() async {
    // Assume login is successful
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    // Navigate to HomePage
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(),
      drawer: SideMenuBar(
        onItemTapped: (int) {},
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
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
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentPage = (_currentPage + 1) % _bannerImages.length;
      });
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
      body: ListView(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
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
          SizedBox(height: 12),
          // Banner Image Slider
          Container(
            height: 200,
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
          SizedBox(height: 6),
          // Page Indicator
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_bannerImages.length, (int index) {
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
              }),
            ),
          ),
          SizedBox(height: 12),
          // Other content
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

class InstructorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Instructor Page'),
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
