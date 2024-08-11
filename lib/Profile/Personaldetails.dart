import 'package:flutter/material.dart';

class personaldetails extends StatelessWidget {
  const personaldetails ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20), // Margin of 20px from left and right
      child: Container(
        width: 388, // Width: 388px

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity, // Make the inner container hug the width of the parent
              height: 24, // Height: 24px
              color: Colors.black.withOpacity(0), // Opacity: 0px
            ),
            Container(
              width: 388, // Fixed width of 388px
              margin: const EdgeInsets.only(bottom: 20), // Margin between rows

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'icon/dob.png', // Replace with your image path
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        height: 17,
                        child: Text(
                          'Date of Birth', // Static text for the first item
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5), // Space between row and new text
                  Text(
                    '22 July 2002',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 24 / 16,
                      letterSpacing: 0.01,
                      color: Colors.black, // You can adjust the color as needed
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              width: 388, // Fixed width of 388px
              margin: const EdgeInsets.only(bottom: 20), // Margin between rows

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'icon/gen.png', // Replace with your image path
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        height: 17,
                        child: Text(
                          'Gender', // Static text for the first item
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5), // Space between row and new text
                  Text(
                    'Male',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 24 / 16,
                      letterSpacing: 0.01,
                      color: Colors.black, // You can adjust the color as needed
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            Container(
              width: 388, // Fixed width of 388px
              margin: const EdgeInsets.only(bottom: 20), // Margin between rows

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'icon/mailing.png', // Replace with your image path
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        height: 17,
                        child: Text(
                          'Email ID', // Static text for the first item
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5), // Space between row and new text
                  Text(
                    'useremail@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 24 / 16,
                      letterSpacing: 0.01,
                      color: Colors.black, // You can adjust the color as needed
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            Container(
              width: 388, // Fixed width of 388px
              margin: const EdgeInsets.only(bottom: 20), // Margin between rows

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'icon/phn.png', // Replace with your image path
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        height: 17,
                        child: Text(
                          'Mobile Number', // Static text for the first item
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5), // Space between row and new text
                  Text(
                    '+91 956852 956852',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 24 / 16,
                      letterSpacing: 0.01,
                      color: Colors.black, // You can adjust the color as needed
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            Container(
              width: 388, // Fixed width of 388px
              margin: const EdgeInsets.only(bottom: 20), // Margin between rows

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'icon/address.png', // Replace with your image path
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        height: 17,
                        child: Text(
                          'Address', // Static text for the first item
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5), // Space between row and new text
                  Text(
                    'A-76, Sector 45, Noida, Uttar Pradesh'
                    'Near Rockwell Building, 201301',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 24 / 16,
                      letterSpacing: 0.01,
                      color: Colors.black, // You can adjust the color as needed
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            Container(
              width: 388, // Fixed width of 388px
              margin: const EdgeInsets.only(bottom: 20), // Margin between rows

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'icon/edu1.png', // Replace with your image path
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        height: 17,
                        child: Text(
                          'Education State', // Static text for the first item
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5), // Space between row and new text
                  Text(
                    'Uttar Pradesh',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 24 / 16,
                      letterSpacing: 0.01,
                      color: Colors.black, // You can adjust the color as needed
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            Container(
              width: 388, // Fixed width of 388px
              margin: const EdgeInsets.only(bottom: 20), // Margin between rows

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'icon/edu2.png', // Replace with your image path
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        height: 17,
                        child: Text(
                          'Education Board', // Static text for the first item
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5), // Space between row and new text
                  Text(
                    'U.P. Board',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 24 / 16,
                      letterSpacing: 0.01,
                      color: Colors.black, // You can adjust the color as needed
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            Container(
              width: 388, // Fixed width of 388px
              margin: const EdgeInsets.only(bottom: 20), // Margin between rows

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'icon/edu3.png', // Replace with your image path
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        height: 17,
                        child: Text(
                          'Standard/Class', // Static text for the first item
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5), // Space between row and new text
                  Text(
                    'Class-10',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 24 / 16,
                      letterSpacing: 0.01,
                      color: Colors.black, // You can adjust the color as needed
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusts space between buttons
              children: [
                Container(
                  width: 172, // Fixed width: 187px
                  height: 48, // Fixed height: 48px
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0), // Adjusted padding for alignment
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    // Border color is transparent, so no border for this button
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.edit, color: Colors.white), // Icon for the button
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 172,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(
                      colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5), // Adjust the padding to control border thickness
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color of the inner container
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // Adjusts the Row's width to fit its children
                            children: [
                              Text(
                                'Reset Password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  letterSpacing: 0.01,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8), // Adds space between the text and the icon
                              Transform.rotate(
                                angle: 120 * 3.14159 / 180, // Rotates the icon by 120 degrees
                                child: Icon(
                                  Icons.vpn_key, // Key icon
                                  color: Colors.white,
                                  size: 18, // Adjust the size of the icon if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),





              ],
            ),
            SizedBox(height: 28),

          ],



        ),





      ),
    );
  }
}
