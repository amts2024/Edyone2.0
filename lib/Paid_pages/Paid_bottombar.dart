import 'package:flutter/material.dart';

class PaidBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  PaidBottomNavbar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
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
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            _buildNavItem(
              context,
              0,
              'assets/icon/home.png',
              'assets/icon/housebold.png',
              'Home',
            ),
            _buildNavItem(
              context,
              1,
              'assets/images/Paid_page_images/user_classes.png',
              'assets/images/Paid_page_images/users-classbold.png',
              'Classes',
            ),
            _buildNavItem(
              context,
              2,
              'assets/images/Paid_page_images/Assiment.png',
              'assets/images/Paid_page_images/Assimentbold.png',
              'Assignments',
            ),
            _buildNavItem(
              context,
              3,
              'assets/images/Paid_page_images/Analytics.png',
              'assets/images/Paid_page_images/Analyticsbold.png',
              'Analytics',
            ),
            _buildNavItem(
              context,
              4,
              'assets/icon/dot-pending.png',
              'assets/icon/3dot.png',
              'More',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Color(0xFF5E5EEA),
          unselectedItemColor: Colors.grey,
          onTap: onItemTapped,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed, // Prevents shifting of icons
          selectedLabelStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    BuildContext context,
    int index,
    String outlineIconPath,
    String filledIconPath,
    String label,
  ) {
    final bool isSelected = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(0.0),
        child: Image.asset(
          isSelected ? filledIconPath : outlineIconPath,
          width: 24, // Explicit size set to avoid changes
          height: 24,
          color: isSelected ? Color(0xFF5E5EEA) : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}
