import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BankDetailsPage(),
    );
  }
}

class BankDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Make AppBar background transparent
        elevation: 0, // Remove AppBar shadow
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
            SizedBox(width: 5),
            Icon(
              Icons.chevron_right,
              color: Colors.black, // Set icon color to black
              size: 24,
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back icon
          onPressed: () {
            // Add back navigation logic here
          },
        ),
      ),
      body: SingleChildScrollView(
        // Add this to make content scrollable
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 30), // Space between AppBar and the image
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/bank.png', // Use AssetImage for local images
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
              ),
              SizedBox(height: 20), // Space below the image
              Container(
                color: Color(
                    0xFFFFEECB), // Background color for the highlighted content
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'You can add only Bank Account or the UPI ID for the payment details',
                  style: TextStyle(
                    fontSize: 16,
                  ),
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
                  'ADD Bank Account',
                  textAlign: TextAlign.left, // Align text to the left
                  style: TextStyle(
                    fontSize: 14, // Reduced font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Ensure the text is clearly visible
                  ),
                ),
              ),
              SizedBox(
                  height: 20), // Space below the "ADD Bank Account" content
              Text(
                'Enter subject or the topic about which you want to ask doubt',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Set text color to black
                ),
              ),
              SizedBox(height: 20), // Space below the highlighted content
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Set width to 80% of the screen width for left and right spacing
                  padding:
                      const EdgeInsets.all(12.0), // Padding for smaller size
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
                    textAlign: TextAlign.center, // Center the text horizontally
                    style: TextStyle(
                      fontSize: 14, // Reduced font size
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .white, // Ensure the text is clearly visible on the gradient
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Space below the highlighted content
              Container(
                width:
                    double.infinity, // Full width for the "ADD UPI ID" section
                color: Color(
                    0xFFEEDDF7), // Background color for the "ADD UPI ID" section
                padding: const EdgeInsets.all(
                    12.0), // Reduced padding for a smaller size
                child: Text(
                  'ADD UPI ID',
                  textAlign: TextAlign.left, // Align text to the left
                  style: TextStyle(
                    fontSize: 14, // Reduced font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Ensure the text is clearly visible
                  ),
                ),
              ),
              SizedBox(height: 20), // Space below the "ADD UPI ID" content
              Text(
                'Enter subject or the topic about which you want to ask doubt',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Set text color to black
                ),
              ),
              SizedBox(height: 20), // Space below the highlighted content
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Set width to 80% of the screen width for left and right spacing
                  padding:
                      const EdgeInsets.all(12.0), // Padding for smaller size
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
                    'ADD UPI ID',
                    textAlign: TextAlign.center, // Center the text horizontally
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
      ),
    );
  }
}
