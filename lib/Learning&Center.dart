import 'package:flutter/material.dart';

class LearningCenter extends StatefulWidget {
  @override
  _LearningCenterState createState() => _LearningCenterState();
}

class _LearningCenterState extends State<LearningCenter> {
  int _currentIndex = 0;
  int _selectedIndex = -1; // Track the selected list item

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onListItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected item index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Learning Center'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(25.0),
              children: <Widget>[
                _buildListItem(0, Icons.live_tv, 'Live Classes'),
                _buildListItem(1, Icons.videocam, 'Record Videos'),
                _buildListItem(2, Icons.question_answer, 'MCQs'),
                _buildListItem(3, Icons.assignment, 'DPPs'),
                _buildListItem(4, Icons.assessment, 'Tests'),
                _buildListItem(5, Icons.note, 'Notes'),
                _buildListItem(6, Icons.book, 'Books'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
              _buildNavItem(0, 'icon/home.png', 'icon/home.png', 'Home'),
              _buildNavItem(
                  1, 'icon/userclasess.png', 'icon/userclasess.png', 'Classes'),
              _buildNavItem(
                  2, 'icon/notebook.png', 'icon/notebook.png', 'Assignments'),
              _buildNavItem(
                  3, 'icon/chartpi.png', 'icon/chartpi.png', 'Analytics'),
              _buildNavItem(
                  4, 'icon/dot-pending.png', 'icon/dot-pending.png', 'More'),
            ],
            currentIndex: _currentIndex,
            selectedItemColor: Color(0xFF5E5EEA),
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            backgroundColor: Colors.white,
            showUnselectedLabels: true,
            showSelectedLabels: true,
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(int index, IconData icon, String text) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onListItemTapped(index),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                  left: BorderSide(
                      width: 4.0, color: Color(0xFF5E5EEA))) // Selected border
              : null,
        ),
        child: ListTile(
          leading: SizedBox(
            width: 24.0,
            height: 24.0,
            child: Icon(
              icon,
              color: Color(0xFF5E5EEA),
              size: 24.0,
            ),
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    int index,
    String outlineIconPath,
    String filledIconPath,
    String label,
  ) {
    final bool isSelected = _currentIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
        ),
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
