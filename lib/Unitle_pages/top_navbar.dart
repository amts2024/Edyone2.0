import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopNavbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _TopNavbarState createState() => _TopNavbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TopNavbarState extends State<TopNavbar> {
  String? name;

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        name ?? 'Name',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xff060302)),
      ), // Display the user's name or 'Name' if not yet loaded
      leading: Builder(
        builder: (context) => IconButton(
          icon: ImageIcon(
            AssetImage('assets/icon/Category.png'),
            color: Color(0xFF454545),
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/icon/shop_cart.png'),
            color: Color(0xFF454545),
          ),
          onPressed: () {
            // Add your functionality here
          },
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/icon/bell.png'),
            color: Color(0xFF454545),
          ),
          onPressed: () {
            // Add your functionality here
          },
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/icon/profile.png'),
            color: Color(0xFF454545),
          ),
          onPressed: () {
            // Add your functionality here
          },
        ),
      ],
    );
  }
}
