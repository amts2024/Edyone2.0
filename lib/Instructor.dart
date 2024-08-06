// import 'package:flutter/material.dart';
//
// class GradientBorderPainter extends CustomPainter {
//   final Gradient gradient;
//   final double strokeWidth;
//   final double radius;
//
//   GradientBorderPainter({
//     required this.gradient,
//     this.strokeWidth = 2.0,
//     this.radius = 5.0,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Offset.zero & size;
//     final rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
//     final paint = Paint()
//       ..shader = gradient.createShader(rect)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth;
//
//     canvas.drawRRect(rRect, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
//
// class GradientBorderTextField extends StatelessWidget {
//   final Gradient gradient;
//   final double strokeWidth;
//   final double radius;
//   final String hintText;
//   final List<String> dropdownItems;
//   final double dropdownWidth;
//   final double dropdownHeight;
//
//   GradientBorderTextField({
//     required this.gradient,
//     this.strokeWidth = 2.0,
//     this.radius = 5.0,
//     required this.hintText,
//     required this.dropdownItems,
//     this.dropdownWidth = 100.0,
//     this.dropdownHeight = 40.0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: GradientBorderPainter(
//         gradient: gradient,
//         strokeWidth: strokeWidth,
//         radius: radius,
//       ),
//       child: Container(
//         padding: EdgeInsets.all(strokeWidth),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(radius),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: hintText,
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
//                 ),
//               ),
//             ),
//             Container(
//               width: dropdownWidth,
//               height: dropdownHeight,
//               child: DropdownButton<String>(
//                 icon: Icon(Icons.arrow_drop_down),
//                 isExpanded: true,
//                 underline: SizedBox(),
//                 items: dropdownItems.map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   // Handle dropdown item selection
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.fromLTRB(35, 41, 16, 0),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back),
//                   onPressed: () {
//                     // Add onPressed functionality here
//                   },
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   'Instructors',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 24),
//           Padding(
//             padding: EdgeInsets.fromLTRB(19, 0, 14, 0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: GradientBorderTextField(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFFA10048), Color(0xFF2300FF)],
//                     ),
//                     hintText: 'Select Classes',
//                     dropdownItems: ['Option 1', 'Option 2', 'Option 3'],
//                     dropdownWidth: 60.0,
//                     dropdownHeight: 40.0,
//                   ),
//                 ),
//                 SizedBox(width: 24),
//                 Expanded(
//                   child: GradientBorderTextField(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFFA10048), Color(0xFF2300FF)],
//                     ),
//                     hintText: 'Select Classes',
//                     dropdownItems: ['Option 1', 'Option 2', 'Option 3'],
//                     dropdownWidth: 60.0,
//                     dropdownHeight: 40.0,
//
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'Instructor_deatails.dart';
import 'Navbar.dart';

class GradientBorderPainter extends CustomPainter {
  final Gradient gradient;
  final double strokeWidth;
  final double radius;

  GradientBorderPainter({
    required this.gradient,
    this.strokeWidth = 2.0,
    this.radius = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class GradientBorderTextField extends StatelessWidget {
  final Gradient gradient;
  final double strokeWidth;
  final double radius;
  final String hintText;
  final List<String> dropdownItems;
  final double dropdownWidth;
  final double dropdownHeight;

  GradientBorderTextField({
    required this.gradient,
    this.strokeWidth = 2.0,
    this.radius = 7.0,
    required this.hintText,
    required this.dropdownItems,
    this.dropdownWidth = 100.0,
    this.dropdownHeight = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(
        gradient: gradient,
        strokeWidth: strokeWidth,
        radius: radius,
      ),
      child: Container(
        padding: EdgeInsets.all(strokeWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                ),
              ),
            ),
            Container(
              width: dropdownWidth,
              height: dropdownHeight,
              child: DropdownButton<String>(
                icon: Icon(Icons.arrow_drop_down),
                isExpanded: true,
                underline: SizedBox(),
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown item selection
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class UserCard extends StatelessWidget {
  final String photoUrl;
  final String username;
  final String subject;
  final String customIconPath;

  UserCard({
    required this.photoUrl,
    required this.username,
    required this.subject,
    required this.customIconPath,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the desired page here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details()), // Replace YourPage with your desired page
        );
      },
      child: Container(
        width: 187, // Set the width here
        height: 190, // Set the height here
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFA10048).withOpacity(0.15),
                  Color(0xFF2300FF).withOpacity(0.15),
                ],
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: CircleAvatar(
                      radius: 27.0,
                      backgroundImage: AssetImage(photoUrl),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.0),
                    child: Text(
                      username,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(customIconPath, height: 16.0, width: 16.0),
                      SizedBox(width: 4.0),
                      Text(
                        subject,
                        style: TextStyle(fontSize: 12.0, color: Color(0xFF4F4F4F)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: Divider(
                      height: 22.0,
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Image/image1.png', // Path to your custom courses icon
                        height: 16.0,
                        width: 16.0,
                        // color: Color(0xFF4F4F4F), // Color of the icon
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '5 Courses',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold,fontFamily: 'Poppins',),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 8, 16, 0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Navbar()), // Replace YourPage with your desired page
                    );
                  },
                ),
                SizedBox(width: 10),
                Text(
                  'Instructors',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.fromLTRB(19, 0, 14, 0),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GradientBorderTextField(
                        gradient: LinearGradient(
                          colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                        ),
                        hintText: 'Select Classes',
                        dropdownItems: ['Option 1', 'Option 2', 'Option 3'],
                        dropdownWidth: 60.0,
                        dropdownHeight: 40.0,
                      ),
                      Positioned(
                        right: 135,
                        top: -8,
                        child: Image.asset(
                          'icon/premium.png', // Path to your premium icon
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Stack(
                    children: [
                      GradientBorderTextField(
                        gradient: LinearGradient(
                          colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                        ),
                        hintText: 'Select Classes',
                        dropdownItems: ['Option 1', 'Option 2', 'Option 3'],
                        dropdownWidth: 60.0,
                        dropdownHeight: 40.0,
                      ),
                      Positioned(
                        right: 135,
                        top: -8,
                        child: Image.asset(
                          'icon/premium.png', // Path to your premium icon
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              padding: EdgeInsets.all(12.0),
              children: List.generate(6, (index) {
                return UserCard(
                  photoUrl: 'assets/Image/profile.png',
                  username: 'User $index',
                  subject: 'Physics', // Replace with dynamic data
                  customIconPath: 'assets/icon/mybook.png', // Replace with your custom icon path
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
