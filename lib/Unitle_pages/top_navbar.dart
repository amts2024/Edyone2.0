import 'package:flutter/material.dart';

class TopNavbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('My App'),
      leading: Builder(
        builder: (context) => IconButton(
          icon: ImageIcon(
            AssetImage('icon/Category.png'),
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
            AssetImage('icon/shop_cart.png'),
            color: Color(0xFF454545),
          ),
          onPressed: () {
            // Add your functionality here
          },
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('icon/bell.png'),
            color: Color(0xFF454545),
          ),
          onPressed: () {
            // Add your functionality here
          },
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('icon/profile.png'),
            color: Color(0xFF454545),
          ),
          onPressed: () {
            // Add your functionality here
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
