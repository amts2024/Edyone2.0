import 'package:flutter/material.dart';

class PurchasePage extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<PurchasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Your content here
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_sharp),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Purchase',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xFF0B121F),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 388, // Specified width
                  height: 250, // Specified height
                  margin: const EdgeInsets.only(
                      top:
                          10), // Adjust this as needed to position the container
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF), // Background color
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8), // Border radius for top-left
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.15), // Shadow color with opacity (0x26 is equivalent to 15% opacity)
                        spreadRadius: 0,
                        blurRadius: 20, // Blur radius for shadow
                        offset: const Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        16.0), // Optional padding inside the container
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Add your content here
                        Text(
                          'Price Details',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 16.8 / 14,
                            color: Color(0xFF000000), // Example text color
                          ),
                        ),
                        Container(
                          width: 357, // Fixed width
                          margin: const EdgeInsets.only(
                              top: 20), // Adjust margin as needed
                          padding: const EdgeInsets
                              .symmetric(), // Padding for internal spacing
                          decoration: BoxDecoration(
                            color: Colors
                                .transparent, // Background color set to transparent if opacity is 0
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Row 1
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // Space between the two text widgets
                                children: [
                                  Text(
                                    'Price Details',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF676767), // Text color
                                    ),
                                  ),
                                  Text(
                                    '₹ 5298', // Replace with your price value
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF676767), // Text color
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10), // Space between rows

                              // Row 2
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // Space between the two text widgets
                                children: [
                                  Text(
                                    'Discount Applied',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF676767), // Text color
                                    ),
                                  ),
                                  Text(
                                    '- ₹ 599', // Replace with your discount value
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF17C16A), // Text color
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10), // Space between rows

                              // Row 3
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // Space between the two text widgets
                                children: [
                                  Text(
                                    'Promo Code',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF676767), // Text color
                                    ),
                                  ),
                                  Text(
                                    'FEST40', // Replace with your total amount value
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF17C16A), // Text color
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10), // Space between rows
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // Space between the two text widgets
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF676767), // Text color
                                    ),
                                  ),
                                  Text(
                                    '₹ 4699', // Replace with your total amount value
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF676767), // Text color
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10), // Space between rows
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // Space between the two text widgets
                                children: [
                                  Text(
                                    'GST 18%',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF676767), // Text color
                                    ),
                                  ),
                                  Text(
                                    '₹ 789.45', // Replace with your total amount value
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF676767), // Text color
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20), // Space between rows
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // Space between the two text widgets
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF1B1B1B), // Text color
                                    ),
                                  ),
                                  Text(
                                    '₹ 6699.45', // Replace with your total amount value
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 16.8 /
                                          14, // Equivalent to 16.8px line height
                                      color: Color(0xFF1B1B1B), // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 388, // Specified width
                  height: 86, // Specified height
                  margin: const EdgeInsets.only(
                      top:
                          10), // Adjust this as needed to position the container
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF), // Background color
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8), // Top-left border radius
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.15), // Shadow color with opacity (0x26 is equivalent to 15% opacity)
                        spreadRadius: 0,
                        blurRadius: 20, // Blur radius for shadow
                        offset: const Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        16.0), // Optional padding inside the container
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Existing Container with "Apply offer/promo code" and "Apply"
                            Padding(
                              padding: const EdgeInsets
                                  .only(), // Adjust the top padding as needed
                              child: Center(
                                child: Container(
                                  width: 356 -
                                      20, // Total width (388) minus the left and right padding (10 + 10)
                                  height: 40, // Specified height
                                  padding: const EdgeInsets.fromLTRB(
                                      16, 11, 10, 11), // Internal padding
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                          4), // Specified border radius for top-left
                                    ),
                                    border: Border.all(
                                        color: Color(0xFFE4E4E4),
                                        width: 1), // Border color and width
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween, // Space between the two text widgets
                                    children: [
                                      Text(
                                        'Apply offer/promo code',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 16.8 /
                                              14, // Equivalent to 16.8px line height
                                          color:
                                              Color(0xFF9A9A9A), // Text color
                                        ),
                                      ),
                                      Text(
                                        'Apply',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          height: 16.8 /
                                              14, // Equivalent to 16.8px line height
                                          color:
                                              Color(0xFFA505D5), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 0),
                            // Space between the container and the new row
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Space between the two texts
                              children: [
                                Text(
                                  '*Promo FEST40 applied',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    height: 12 /
                                        10, // Equivalent to 12px line height
                                    color: Color(0xFF14B11B), // Text color
                                  ),
                                ),

                                // SizedBox provides space between the two texts
                                const SizedBox(width: 140),

                                Text(
                                  'View All Offers',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    height: 12 /
                                        10, // Equivalent to 12px line height
                                    color: Color(0xFF1565C0), // Text color
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment
                .bottomCenter, // Aligns the container to the bottom center
            child: Container(
              width: 428, // Fixed width
              height: 64, // Fixed height
              padding: const EdgeInsets.fromLTRB(
                  16, 12, 16, 11), // Padding as specified
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), // Shadow color with opacity
                    spreadRadius: 0,
                    blurRadius: 4, // Blur radius for shadow
                    offset: const Offset(0, -3), // Shadow position
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Space between child widgets
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          '₹ 1200',
                          style: TextStyle(
                            fontFamily: 'Poppins', // Font family
                            fontSize: 20, // Font size
                            fontWeight: FontWeight.w700, // Font weight
                            height: 1.2, // Line height
                            color: Color(0xFF3C3C3C), // Text color
                          ),
                        ),
                      ),
                      Icon(
                        Icons.info_outline, // Circle info icon
                        color: Color(0xFF3C3C3C), // Icon color
                        size: 12, // Set the desired size for the icon
                      ),
                    ],
                  ),
                  Container(
                    width: 177, // Fixed width
                    height: 41, // Hug height
                    padding: EdgeInsets.symmetric(
                        vertical: 12, horizontal: 2), // Padding
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFA10048),
                          Color(0xFF2300FF)
                        ], // Gradient background
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6), // Rounded top-left corner
                        bottomLeft:
                            Radius.circular(6), // Rounded top-left corner
                        bottomRight:
                            Radius.circular(6), // Rounded top-left corner
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Continue to Pay',
                        style: TextStyle(
                          fontFamily: 'Poppins', // Font family
                          fontSize: 14, // Font size
                          fontWeight: FontWeight.w600, // Font weight
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
