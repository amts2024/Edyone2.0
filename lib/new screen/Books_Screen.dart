import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"), // AppBar with "Books"
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to start
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20), // Aligning the text box
              child: Container(
                width: 388, // Width of the text box
                height: 68, // Height of the text box
                color: Colors.transparent, // Opacity 0 (transparent)
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus velit aliquam consequat eu nunc sed. Nec quis ut purus nunc malesuada augue pellentesque fermentum.',
                  style: TextStyle(
                    fontFamily: 'Poppins', // Font family
                    fontSize: 14, // Font size
                    fontWeight: FontWeight.w400, // Font weight
                    height: 1.2, // Line height (16.8px / 14px = 1.2)
                    color: Color(0xFF70747E), // Color #70747E
                  ),
                  textAlign: TextAlign.left, // Text alignment
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(left: 10), // Adds left margin of 10 pixels
              width: 380, // Sets the width of the Divider to 100 pixels
              child: Divider(
                thickness: 1, // You can adjust the thickness here
                color:
                    Color(0xFFDAD4D4), // Optional: set the color of the Divider
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align items to the start
              children: [
                // First Container
                _buildBookCard(),
                // Spacing between containers
                // Second Container
                _buildBookCard(),
              ],
            ),
            SizedBox(height: 20), // Space between rows
            // Row 2: Two containers side by side
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align items to the start
              children: [
                // First Container
                _buildBookCard(),
                // Spacing between containers
                // Second Container
                _buildBookCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method to build a book card container
  Widget _buildBookCard() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 163,
      height: 325,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFFF8F8F8), // Background color
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000), // Shadow color with opacity
            blurRadius: 8,
            offset: Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          Container(
            width: 163,
            height: 231,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
              ),
            ),
            child: Image.asset(
              'assets/images/img.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10), // Gap between image and text

          // Text: NCERT Mathematics
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'NCERT Mathematics',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.5, // line-height equivalent
                letterSpacing: 0.01,
                color: Color(0xFF282F3E),
              ),
            ),
          ),

          // Text: Class 10
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Class 10',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.5, // line-height equivalent
                letterSpacing: 0.01,
                color: Color(0xFF282F3E),
              ),
            ),
          ),

          SizedBox(height: 8), // Gap before the next row

          // Row with small image and instructor name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                // Small Image
                Container(
                  width: 24.57,
                  height: 24.57,
                  child: Image.asset('assets/images/Ellipse 4.png'),
                ),
                SizedBox(width: 8), // Gap between image and text

                // Instructor Name
                Text(
                  'Instructor Name',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10.75,
                    fontWeight: FontWeight.w400,
                    height: 1.5, // line-height equivalent
                    color: Color(0xFF170F49),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
