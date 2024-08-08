import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavbar({required this.selectedIndex, required this.onItemTapped});

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
              'icon/home.png',
              'icon/housebold.png',
              'Home',
            ),
            _buildNavItem(
              context,
              1,
              'icon/lesson.png',
              'icon/lessonbold.png',
              'Courses',
            ),
            _buildNavItem(
              context,
              2,
              'icon/workshop.png',
              'icon/workshopbold.png',
              'Learning Center',
            ),
            _buildNavItem(
              context,
              3,
              'icon/books.png',
              'icon/booksbold.png',
              'Batch',
            ),
            _buildNavItem(
              context,
              4,
              'icon/dot-pending.png',
              'icon/3dot.png',
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
        padding: EdgeInsets.all(8.0),
        child: Image.asset(
          isSelected ? filledIconPath : outlineIconPath,
          width: 24,
          height: 24,
          color: isSelected ? Color(0xFF5E5EEA) : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}
