import 'package:flutter/material.dart';

class UpdateAddrerss extends StatelessWidget {
  const UpdateAddrerss({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20), // Margin of 20px from left and right
      child: Column(
        children: [
          Container(
            width: 388, // Fill width to 388px
            height: 24, // Hug height to 24px
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and icon
              children: [
                Text(
                  'Update Address',
                  style: TextStyle(
                    fontSize: 16, // Adjust font size as needed
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
                Container(
                  child: Image.asset(
                    'icon/cross.png', // Replace with your image path
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Adds space between the sections

          Container(
            width: 388, // Fill width to 388px
            height: 47,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF70747E), // Border color #232323
                  width: 1, // Border height 1px
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Floor/House No.',
                style: TextStyle(
                  fontFamily: 'Poppins', // Font-family: Poppins
                  fontSize: 18, // Font-size: 18px
                  fontWeight: FontWeight.w500, // Font-weight: 500
                  height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                  letterSpacing: 0.01, // Letter-spacing: 0.01em
                  color: Color(0xFF70747E), // Text-color: #232323
                ),
                textAlign: TextAlign.left, // Text-align: left
              ),
            ),
          ),
          SizedBox(height: 20), // Adds space between the sections

          Container(
            width: 388, // Fill width to 388px
            height: 47,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF70747E), // Border color #232323
                  width: 1, // Border height 1px
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Floor/House No.',
                style: TextStyle(
                  fontFamily: 'Poppins', // Font-family: Poppins
                  fontSize: 18, // Font-size: 18px
                  fontWeight: FontWeight.w500, // Font-weight: 500
                  height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                  letterSpacing: 0.01, // Letter-spacing: 0.01em
                  color: Color(0xFF70747E), // Text-color: #232323
                ),
                textAlign: TextAlign.left, // Text-align: left
              ),
            ),
          ),
          SizedBox(height: 20), // Adds space between the sections

          Container(
            width: 388, // Fill width to 388px
            height: 47,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF70747E), // Border color #232323
                  width: 1, // Border height 1px
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Address',
                style: TextStyle(
                  fontFamily: 'Poppins', // Font-family: Poppins
                  fontSize: 18, // Font-size: 18px
                  fontWeight: FontWeight.w500, // Font-weight: 500
                  height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                  letterSpacing: 0.01, // Letter-spacing: 0.01em
                  color: Color(0xFF70747E), // Text-color: #232323
                ),
                textAlign: TextAlign.left, // Text-align: left
              ),
            ),
          ),

          SizedBox(height: 20), // Adds space between the sections
          Container(
            width: 388, // Fill width to 388px
            height: 47,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF70747E), // Border color #232323
                  width: 1, // Border height 1px
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Landmark',
                style: TextStyle(
                  fontFamily: 'Poppins', // Font-family: Poppins
                  fontSize: 18, // Font-size: 18px
                  fontWeight: FontWeight.w500, // Font-weight: 500
                  height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                  letterSpacing: 0.01, // Letter-spacing: 0.01em
                  color: Color(0xFF70747E), // Text-color: #232323
                ),
                textAlign: TextAlign.left, // Text-align: left
              ),
            ),
          ),

          SizedBox(height: 20), // Adds space between the sections
          Container(
            width: 388, // Fill width to 388px
            height: 47,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF70747E), // Border color #232323
                  width: 1, // Border height 1px
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Zip Code.',
                style: TextStyle(
                  fontFamily: 'Poppins', // Font-family: Poppins
                  fontSize: 18, // Font-size: 18px
                  fontWeight: FontWeight.w500, // Font-weight: 500
                  height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                  letterSpacing: 0.01, // Letter-spacing: 0.01em
                  color: Color(0xFF70747E), // Text-color: #232323
                ),
                textAlign: TextAlign.left, // Text-align: left
              ),
            ),
          ),

          SizedBox(height: 20), // Adds space between the sections
          Container(
            width: 388, // Fill width to 388px
            height: 47,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF70747E), // Border color #232323
                  width: 1, // Border height 1px
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the text and icon
              children: [
                Text(
                  'State',
                  style: TextStyle(
                    fontFamily: 'Poppins', // Font-family: Poppins
                    fontSize: 18, // Font-size: 18px
                    fontWeight: FontWeight.w500, // Font-weight: 500
                    height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                    letterSpacing: 0.01, // Letter-spacing: 0.01em
                    color: Color(0xFF70747E), // Text-color: #232323
                  ),
                  textAlign: TextAlign.left, // Text-align: left
                ),
                Icon(Icons.expand_more, color: Color(0xFF70747E)), // Dropdown icon
              ],
            ),
          ),

          SizedBox(height: 20), // Adds space between the sections
          Container(
            width: 388, // Fill width to 388px
            height: 47,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF70747E), // Border color #232323
                  width: 1, // Border height 1px
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the text and icon
              children: [
                Text(
                  'City',
                  style: TextStyle(
                    fontFamily: 'Poppins', // Font-family: Poppins
                    fontSize: 18, // Font-size: 18px
                    fontWeight: FontWeight.w500, // Font-weight: 500
                    height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                    letterSpacing: 0.01, // Letter-spacing: 0.01em
                    color: Color(0xFF70747E), // Text-color: #232323
                  ),
                  textAlign: TextAlign.left, // Text-align: left
                ),
                Icon(Icons.expand_more, color: Color(0xFF70747E)), // Dropdown icon
              ],
            ),
          ),


          SizedBox(height: 20), // Adds space between the sections

          Container(
            width: 388,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Simplified border radius
              gradient: LinearGradient(
                colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Submit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.2, // Equivalent to line-height
                      letterSpacing: 0.01,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20), // Adds space between the sections

        ],
      ),
    );
  }
}
