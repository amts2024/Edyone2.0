import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Instructor.dart';

class SideMenuBar extends StatelessWidget {
  final Function(int) onItemTapped;

  SideMenuBar({required this.onItemTapped});

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
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.transparent),
                ),
              ),
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
                  child: Image.asset(
                    'images/header.png',
                    height: 60,
                    width: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Divider(color: Colors.grey),
            ),
            _createDrawerItem(
              icon: AssetImage('icon/home.png'),
              text: 'Home',
              onTap: () => onItemTapped(0),
            ),
            _createDrawerItem(
              icon: AssetImage('icon/refer.png'),
              text: 'Refer & Earn',
              onTap: () => onItemTapped(1),
            ),
            _createDrawerItem(
              icon: AssetImage('icon/wallet.png'),
              text: 'Wallet',
              onTap: () => onItemTapped(2),
            ),
            _createDrawerItem(
              icon: AssetImage('icon/date.png'),
              text: 'Calendar',
              onTap: () => onItemTapped(3),
            ),
            _createDrawerItem(
              icon: AssetImage('icon/instrutor.png'),
              text: 'Instructor',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWidget()),
              ),
            ),
            // Add more items here...
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
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
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {required AssetImage icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      leading: ImageIcon(
        icon,
        size: 24,
        color: Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14.0,
          color: Color(0xFF696969),
        ),
      ),
      onTap: onTap,
    );
  }
}
