// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:share/share.dart'; // Import this for Clipboard functionality
//
// class ReferAndEarnPage extends StatelessWidget {
//   final String referralCode = 'ABHBGYG878'; // Referral code
//   final double earnings = 200.0; // Replace with dynamic earnings
//
//   @override
//   Widget build(BuildContext context) {
//     // Get screen width and height using MediaQuery
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     // Determine sizes relative to screen dimensions
//     double containerWidth = screenWidth * 0.9; // 90% of screen width
//     double textSize = screenWidth * 0.04; // 4% of screen width for text
//     double paddingSize =
//         screenWidth * 0.04; // Padding size relative to screen width
//     double containerHeightFixed = 65; // Fixed height for the new container
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context); // Navigate back to the previous screen
//           },
//         ),
//         title: Text('Refer and Earn'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(paddingSize),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.asset(
//                 'assets/images/referandearns.png', // Ensure this path is correct
//                 height: screenHeight * 0.25, // 25% of screen height
//                 width: double.infinity, // Full width
//                 fit: BoxFit.cover, // Adjust the fit as needed
//               ),
//             ),
//             SizedBox(height: paddingSize),
//             Container(
//               width: containerWidth, // Responsive width
//               height: containerHeightFixed.toDouble(), // Fixed height
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFAB07), // Background color
//                 borderRadius: BorderRadius.circular(8), // Border radius
//               ),
//               child: Center(
//                 child: Text(
//                   'Refer & Earn', // Text content
//                   style: TextStyle(
//                     fontSize: textSize *
//                         1.2, // Responsive text size (adjust as needed)
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white, // Text color
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: paddingSize),
//             Container(
//               width: containerWidth, // Responsive width
//               padding: EdgeInsets.all(paddingSize), // Responsive padding
//               decoration: BoxDecoration(
//                 color: Color(0xFFF4F4CC), // Updated background color
//                 borderRadius: BorderRadius.circular(8), // Border radius
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment
//                     .stretch, // Ensure the child takes full width
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(
//                         paddingSize), // Padding inside the RichText container
//                     child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         style: TextStyle(
//                           fontSize: textSize, // Responsive text size
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black, // Default text color
//                         ),
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: 'Refer your friends & get ', // Normal text
//                             style: TextStyle(
//                               color: Colors.black, // Set color to black
//                             ),
//                           ),
//                           TextSpan(
//                             text: '10% cashback ',
//                             style: TextStyle(
//                               color: Colors.blue, // Color for "10% cashback"
//                             ),
//                           ),
//                           TextSpan(
//                             text: 'in your wallet',
//                             style: TextStyle(
//                               color: Colors.black, // Color for "in your wallet"
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                       height:
//                           paddingSize), // Space between the RichText and the Total Earnings section
//                   Container(
//                     height:
//                         containerHeightFixed, // Fixed height for the total earnings container
//                     padding: EdgeInsets.all(
//                         paddingSize), // Padding inside the container
//                     decoration: BoxDecoration(
//                       color:
//                           Color(0xFF189416), // Set background color to #189416
//                       borderRadius: BorderRadius.circular(
//                           12), // Set border radius to 12 pixels
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Total Earnings: \$${earnings.toStringAsFixed(2)}', // Dynamic text content
//                         style: GoogleFonts.poppins(
//                           // Use Poppins font
//                           fontSize: 18, // Font size of 18px
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white, // Text color white
//                         ),
//                         textAlign: TextAlign.center, // Center the text
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                       height:
//                           paddingSize), // Space between the Total Earnings and the referral code section
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(paddingSize),
//               child: Center(
//                 child: Text(
//                   'Referral Code: $referralCode',
//                   style: TextStyle(
//                     fontSize: textSize,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black, // Text color black
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             SizedBox(
//                 height:
//                     paddingSize), // Space between the referral code and the new container
//             Container(
//               width: double.infinity, // Full width of its parent
//               child: Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 80, // Fixed height of 80px
//                     child: Row(
//                       children: [
//                         // 80% light gray background
//                         Expanded(
//                           flex: 8,
//                           child: Container(
//                             color: Color(
//                                 0xFFF2F2F2), // Light gray background color
//                             child: Row(
//                               children: [
//                                 // 70% section with referral link text
//                                 Expanded(
//                                   flex: 7,
//                                   child: Container(
//                                     color: Color(
//                                         0xFFF2F2F2), // Light gray background color
//                                     child: Center(
//                                       child: Text(
//                                         referralCode, // Referral code text
//                                         style: TextStyle(
//                                           fontSize: textSize,
//                                           fontWeight: FontWeight.bold,
//                                           color:
//                                               Colors.black, // Text color black
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 // 10% section with copy icon
//                                 Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     color: Color(0xFFF2F2F2)
//                                         .withOpacity(0.8), // Light black color
//                                     child: Center(
//                                       child: IconButton(
//                                         icon: Icon(Icons.copy,
//                                             color: Colors.black), // Copy icon
//                                         onPressed: () {
//                                           Clipboard.setData(ClipboardData(
//                                               text: referralCode));
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                             SnackBar(
//                                                 content: Text(
//                                                     'Copied to clipboard')),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         // 20% section with share icon
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             color: Colors
//                                 .transparent, // Transparent background for blur
//                             child: ShaderMask(
//                               shaderCallback: (rect) {
//                                 return LinearGradient(
//                                   colors: [
//                                     Colors.transparent,
//                                     Colors.blue.withOpacity(
//                                         0.3), // Adjust color for blue effect
//                                   ],
//                                   stops: [0.8, 1.0],
//                                   begin: Alignment.centerLeft,
//                                   end: Alignment.centerRight,
//                                 ).createShader(rect);
//                               },
//                               blendMode: BlendMode.srcOver,
//                               child: Container(
//                                 color: Colors.blue, // Blue background
//                                 child: Center(
//                                   child: IconButton(
//                                     icon: Icon(Icons.share,
//                                         color: Colors.white), // Share icon
//                                     onPressed: () {
//                                       Share.share(
//                                           'Check out my referral code: $referralCode');
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 10), // Space between sections
//                   Container(
//                     width: double.infinity, // Full width of its parent
//                     height: 80, // Fixed height of 80px
//                     child: Row(
//                       children: [
//                         // "Referral Link" label on the left
//                         Expanded(
//                           flex: 6,
//                           child: Container(
//                             color: Color(
//                                 0xFFF2F2F2), // Light gray background color
//                             child: Center(
//                               child: Text(
//                                 'Referral Link', // "Referral Link" text
//                                 style: TextStyle(
//                                   fontSize: textSize,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black, // Text color black
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         ),
//                         // "Copy Link" label on the right
//                         Expanded(
//                           flex: 4,
//                           child: Container(
//                             color: Color(
//                                 0xFFF2F2F2), // Light gray background color
//                             child: Center(
//                               child: Text(
//                                 'Copy Link', // "Copy Link" text
//                                 style: TextStyle(
//                                   fontSize: textSize,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black, // Text color black
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                       height:
//                           paddingSize), // Space between the referral link and the URL container
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(paddingSize),
//                     color: Color(0xFFF2F2F2), // Light gray background color
//                     child: Center(
//                       child: Text(
//                         'http://example.com/referral/$referralCode', // URL text
//                         style: TextStyle(
//                           fontSize: textSize,
//                           color: Colors.black
//                               .withOpacity(0.6), // Light black color
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                       height:
//                           paddingSize), // Space between the URL container and the image
//                   Image.asset(
//                     'assets/images/Frame.png', // Replace with your image path
//                     width: double.infinity, // Full width of the parent
//                     fit: BoxFit.cover, // Adjust the fit as needed
//                   ),
//                   SizedBox(
//                       height:
//                           paddingSize), // Space between the image and FAQs text
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: paddingSize), // Horizontal padding
//                     child: Text(
//                       'FAQs', // FAQs text
//                       style: TextStyle(
//                         fontSize: textSize *
//                             1.2, // Slightly larger font size for emphasis
//                         fontWeight: FontWeight.bold, // Bold text
//                         color: Colors.blue, // Blue color for FAQs text
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                       height:
//                           paddingSize), // Space between FAQs and the new row
//                   Row(
//                     mainAxisAlignment:
//                         MainAxisAlignment.spaceBetween, // Space between items
//                     children: [
//                       Expanded(
//                         flex: 6,
//                         child: Container(
//                           padding: EdgeInsets.all(paddingSize),
//                           color:
//                               Color(0xFFF2F2F2), // Light gray background color
//                           child: Center(
//                             child: Text(
//                               'Referral History', // "Referral History" text
//                               style: TextStyle(
//                                 fontSize: textSize,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black, // Text color black
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 4,
//                         child: Container(
//                           padding: EdgeInsets.all(paddingSize),
//                           color:
//                               Color(0xFFF2F2F2), // Light gray background color
//                           child: Center(
//                             child: DropdownButton<String>(
//                               isExpanded: true, // Make dropdown full-width
//                               value: 'All', // Default value
//                               items: <String>['All', 'Monthly']
//                                   .map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (String? newValue) {
//                                 // Handle the filter change
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                       height:
//                           paddingSize), // Space before the user details section
//                   Container(
//                     width: double.infinity,
//                     height: 80, // Fixed height for user details section
//                     padding: EdgeInsets.all(paddingSize),
//                     child: Row(
//                       children: [
//                         // Circle with user icon
//                         CircleAvatar(
//                           radius: 30, // Radius of the circle
//                           backgroundColor: Colors.grey[300], // Background color
//                           child: Icon(
//                             Icons.person, // User icon
//                             size: 40, // Icon size
//                             color: Colors.black, // Icon color
//                           ),
//                         ),
//                         SizedBox(
//                             width: paddingSize), // Space between icon and text
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'User Name', // Placeholder for user name
//                               style: TextStyle(
//                                 fontSize: textSize,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black, // Text color black
//                               ),
//                             ),
//                             SizedBox(
//                                 height:
//                                     4), // Space between user name and status
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.circle, // Green dot
//                                   color: Colors.green,
//                                   size: 10,
//                                 ),
//                                 SizedBox(
//                                     width: 4), // Space between dot and text
//                                 Text(
//                                   'Success', // Status text
//                                   style: TextStyle(
//                                     fontSize: textSize * 0.9,
//                                     color: Colors.green, // Status color
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Expanded(
//                           child: Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               '₹500', // Amount text
//                               style: TextStyle(
//                                 fontSize: textSize,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black, // Text color black
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
