import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BankDetailsPages(),
    );
  }
}

class BankDetailsPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, // Remove the AppBar shadow
        title: Row(
          children: [
            Text(
              'Bank Details',
              style: TextStyle(
                color: Colors.black, // Set text color to black
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_right,
              color: Colors.black), // Chevron right icon
          onPressed: () {
            Navigator.pop(context); // Add back navigation logic here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0,
            top: 30.0), // Adjust this value to place text below the AppBar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Bank Account Details',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20), // Space below the highlighted content
            Container(
              width: double
                  .infinity, // Full width for the "ADD Bank Account" section
              color: Color(
                  0xFFEEDDF7), // Background color for the "ADD Bank Account" section
              padding: const EdgeInsets.all(
                  12.0), // Reduced padding for a smaller size
              child: Text(
                'Bank Details',
                textAlign: TextAlign.left, // Align text to the left
                style: TextStyle(
                  fontSize: 14, // Reduced font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Ensure the text is clearly visible
                ),
              ),
            ),

            SizedBox(height: 30), // Space between the text and the divider

            // Horizontal lines with the name
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abhishek Singh',
                          style: TextStyle(
                            fontSize: 16, // Adjust the font size as needed
                            fontWeight: FontWeight
                                .w600, // Adjust the font weight if needed
                            color: Colors
                                .black54, // Adjust the text color if needed
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey),
                      ],
                    ),
                  ),

                  SizedBox(height: 25), // Space between lines
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '205008117262',
                          style: TextStyle(
                            fontSize: 16, // Adjust the font size as needed
                            fontWeight: FontWeight
                                .w600, // Adjust the font weight if needed
                            color: Colors
                                .black54, // Adjust the text color if needed
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey),
                      ],
                    ),
                  ),
                  SizedBox(height: 25), // Space between lines
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '9572324826',
                          style: TextStyle(
                            fontSize: 16, // Adjust the font size as needed
                            fontWeight: FontWeight
                                .w600, // Adjust the font weight if needed
                            color: Colors
                                .black54, // Adjust the text color if needed
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey),
                      ],
                    ),
                  ),
                  SizedBox(height: 25), // Space between lines
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'State Bank Of India',
                          style: TextStyle(
                            fontSize: 16, // Adjust the font size as needed
                            fontWeight: FontWeight
                                .w600, // Adjust the font weight if needed
                            color: Colors
                                .black54, // Adjust the text color if needed
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey),
                      ],
                    ),
                  ),
                  SizedBox(height: 25), // Space between lines
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SBIN00011347',
                          style: TextStyle(
                            fontSize: 16, // Adjust the font size as needed
                            fontWeight: FontWeight
                                .w600, // Adjust the font weight if needed
                            color: Colors
                                .black54, // Light black color for the text
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey),
                      ],
                    ),
                  ),

                  SizedBox(height: 20), // Space below the highlighted content
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.8, // Set width to 80% of the screen width for left and right spacing
                      padding: const EdgeInsets.all(
                          12.0), // Padding for smaller size
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFA10048),
                            Color(0xFF2300FF)
                          ], // Gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(
                            8), // Optional: Add rounded corners
                      ),
                      child: Text(
                        'ADD Bank Account',
                        textAlign:
                            TextAlign.center, // Center the text horizontally
                        style: TextStyle(
                          fontSize: 14, // Reduced font size
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .white, // Ensure the text is clearly visible on the gradient
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
