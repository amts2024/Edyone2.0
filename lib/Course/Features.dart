import 'package:flutter/material.dart';


class FeaturesScreen extends StatefulWidget {
  @override
  _FeaturesScreenState createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 16, 0.0, 0.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8), // Optional spacing between icon and text
                  const Text(
                    'Features',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),


              SizedBox(height: 10),
              Positioned(
                top: 689, // Position from top
                left: 20, // Position from left
                child: Container(
                  width: 388, // Hug width

                  decoration: BoxDecoration(
                    color: Colors.transparent, // Transparent background
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // Align children at the start
                    crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                    children: [
                      // First child: Description text


                      // Second child: First part of paragraph text
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top:10), // Padding for the paragraph
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus velit aliquam consequat eu nunc sed. Nec quis ut purus nunc malesuada augue pellentesque fermentum. ', // Replace with actual content
                          style: TextStyle(
                            fontFamily: 'Poppins', // Font family
                            fontSize: 14, // Font size
                            fontWeight: FontWeight.w400, // Font weight
                            height: 16.8/14, // Line height (calculated as 19.6px for 14px font size)
                            color: Color(0xFF000000), // Text color
                          ),
                        ),
                      ),
                      // Break (space) after the first paragraph

                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Positioned(
                top: 971, // Position from top
                left: 40, // Position from left
                child: Container(
                  width: double.infinity, // Expand to fit the content
                  height: 22, // Fixed height
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0), // Transparent background with 0 opacity
                  ),
                  padding: const EdgeInsets.only(left: 20), // Padding for the paragraph
                  child: Text(
                    'Features Of The Platform', // Text content
                    style: TextStyle(
                      fontFamily: 'Poppins', // Font family
                      fontSize: 18, // Font size
                      fontWeight: FontWeight.w600, // Font weight
                      height: 21.6 / 18, // Line height
                      color: Color(0xFF000000), // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment
                  ),
                ),
              ),

              SizedBox(height: 10),
              Positioned(
                top: 1005, // Adjust as needed
                left: 20, // 20px space from the left
                child: Column(
                  children: [
                    // First row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20), // 20px padding from the left
                          child: Container(
                            width: 20, // Fixed width for the image
                            height: 20, // Fixed height for the image
                            decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0), // Transparent background for the image container
                            ),
                            child: Image.asset(
                              'icon/liveclass.png', // Replace with your first image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover, // Adjust image fit if needed
                            ),
                          ),
                        ),
                        SizedBox(width: 8), // Gap between image and text
                        Container(

                          height: 17, // Fixed height for the text
                          child: Text(
                            'Live Classes', // First text
                            style: TextStyle(
                              fontFamily: 'Poppins', // Font family
                              fontSize: 14, // Font size
                              fontWeight: FontWeight.w500, // Font weight
                              height: 16.8 / 14, // Line height
                            ),
                            textAlign: TextAlign.left, // Text alignment
                            maxLines: 1, // Ensure single line of text
                            overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Space between rows

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/recordcls.png', // Replace with your third image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'Record Classes', // Third text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    // Second row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/mcqs.png', // Replace with your second image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'MCQs', // Second text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/mocktest.png', // Replace with your fifth image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'Mock Tests', // Fifth text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/notes1.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'Notes', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/dppsheets.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'DPP Sheets', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/books.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'Books', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/downloadable.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'Downloadable Resources', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/livedoubts.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'Live Doubts Solution', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/access.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'Access on mobile and Tablet', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),


                    // Fourth row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/1year.png', // Replace with your fourth image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            '1 Year Validity', // Fourth text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Fifth row


                    // Sixth row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/askdoubt.png', // Replace with your sixth image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'Ask Doubt Feature', // Sixth text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/affordable.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'Affordable Price', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/experienced.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'Experienced Instructors', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'icon/userfriendly.png', // Replace with your seventh image path
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(

                          height: 17,
                          child: Text(
                            'User friendly Interface', // Seventh text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16.8 / 14,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Seventh row


                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
