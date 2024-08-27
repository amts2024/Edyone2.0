import 'package:flutter/material.dart';

class FollowUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: Text('Follow Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding around the whole body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Description Text
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus velit aliquam consequat eu nunc sed. Nec quis ut purus nunc malesuada augue pellentesque fermentum.',
              style: TextStyle(
                fontSize: 14, // Font size set to 14px
                color: Color.fromRGBO(112, 116, 126, 1), // RGB color
              ),
            ),
            SizedBox(height: 20), // Space between text and border box
            // Border Box
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(16), // Border radius set to 16px
                  border: Border.all(
                    color: Color.fromRGBO(218, 218, 218, 1), // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                      10.0), // Padding inside the border box
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two columns
                      crossAxisSpacing: 10, // Space between columns
                      mainAxisSpacing: 10, // Space between rows
                      childAspectRatio: 160 / 173, // Aspect ratio for the boxes
                    ),
                    itemCount: 6, // Total number of boxes
                    itemBuilder: (context, index) {
                      // Define PNG icon paths and names
                      final List<Map<String, String>> icons = [
                        {
                          'path': 'assets/icon/instagram.png',
                          'name': 'Instagram'
                        },
                        {'path': 'assets/icon/youtube.png', 'name': 'YouTube'},
                        {
                          'path': 'assets/icon/facebook.png',
                          'name': 'Facebook'
                        },
                        {
                          'path': 'assets/icon/whatsapp.png',
                          'name': 'WhatsApp'
                        },
                        {'path': 'assets/icon/twitter.png', 'name': 'Twitter'},
                        {
                          'path': 'assets/icon/linkedin.png',
                          'name': 'LinkedIn'
                        },
                      ];

                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(
                                217, 15, 15, 1), // Red border color
                            width: 1, // Border width
                          ),
                          borderRadius: BorderRadius.circular(
                              16), // Border radius for each box
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Allow Column to adapt to its content
                          children: [
                            // Icon
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  icons[index]['path']!, // Set the icon
                                  width: 50, // Icon width
                                  height: 54, // Icon height
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    5), // Reduced space between icon and name
                            // Name Text
                            Transform.translate(
                              offset:
                                  Offset(0, -20), // Move the name 20 pixels up
                              child: Text(
                                icons[index]['name']!, // Set the name
                                style: TextStyle(
                                  fontSize:
                                      22, // Font size for the name updated to 22px
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 10), // Space between name and button
                            // Adjusted Follow Button
                            Transform.translate(
                              offset: Offset(
                                  0, -20), // Move the button 20 pixels up
                              child: Container(
                                width:
                                    130, // Width of the button inside each box
                                height:
                                    38, // Height of the button inside each box
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(177, 44, 44, 1),
                                      Color.fromRGBO(41, 38, 166, 1),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Color.fromRGBO(
                                        166, 39, 39, 1), // Border color
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Follow',
                                    style: TextStyle(
                                      color: Colors.white, // Text color
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14, // Font size set to 14px
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
