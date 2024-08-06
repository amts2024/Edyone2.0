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
              'icon/home_filled.png',
              'Home',
            ),
            _buildNavItem(
              context,
              1,
              'icon/userclasess.png',
              'icon/userclassesBold.png',
              'Classes',
            ),
            _buildNavItem(
              context,
              2,
              'icon/notebook.png',
              'icon/notebook_filled.png',
              'Assignments',
            ),
            _buildNavItem(
              context,
              3,
              'icon/chartpi.png',
              'icon/chart_filled.png',
              'Analytics',
            ),
            _buildNavItem(
              context,
              4,
              'icon/dot-pending.png',
              'icon/more_filled.png',
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
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.transparent,
          borderRadius: BorderRadius.circular(
              12.0), // Adjust the radius to match your design
        ),
        padding: EdgeInsets.all(8.0), // Adjust padding to your preference
        child: Image.asset(
          isSelected ? filledIconPath : outlineIconPath,
          width: 24,
          height: 24,
          color: isSelected ? Color(0xFF5E5EEA) : Colors.grey,
        ),
      ),
      label: label,
      // You can also use `label` as `null` if you don't want the label to appear
      // Make sure to remove `showUnselectedLabels` and `showSelectedLabels` if you hide labels
    );
  }
}
