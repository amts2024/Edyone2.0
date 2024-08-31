import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Modal/Cart_Model.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<CartModel?> fetchCartDetails() async {
    final response = await http.get(
      Uri.parse('https://admin.edyone.site/api/cart/get-details'),
      headers: {
        'Authorization': 'Bearer fKlw0WyyLhFDZCCuwfKBBlWaREbcj8yn8xPWrVsS',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CartModel.fromJson(json);
    } else {
      // Handle error
      print('Failed to load cart details');
      return null;
    }
  }

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
                      'Cart',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xFF0B121F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // The Container with the specified design
                FutureBuilder<CartModel?>(
                  future: fetchCartDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError || !snapshot.hasData) {
                      return Center(child: Text('Error loading cart details'));
                    } else {
                      final cartDetails =
                          snapshot.data!.data.original.courseDetails;

                      print('Cart Details Length: ${cartDetails.length}');

                      if (cartDetails.isEmpty) {
                        return Center(child: Text('No course details found'));
                      }

                      return SingleChildScrollView(
                        child: Column(
                          children: cartDetails.map((courseDetail) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Container(
                                width: 388,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      spreadRadius: 0,
                                      blurRadius: 20,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 104,
                                        height: 91,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                courseDetail.teacherImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  courseDetail.courseName,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.2,
                                                    letterSpacing: 0.01,
                                                    color: Color(0xFF494949),
                                                  ),
                                                ),
                                                Text(
                                                  '₹ ${courseDetail.coursePrice}',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    height: 19.2 / 16,
                                                    color: Color(0xFF3C3C3C),
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              'Total Chapters: ${courseDetail.totalChapters}',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                height: 14.4 / 12,
                                                color: Color(0xFF818181),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 24,
                                                      height: 24,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              courseDetail
                                                                  .teacherImage),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      courseDetail.teacherName,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 18 / 12,
                                                        color:
                                                            Color(0xFF170F49),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.delete,
                                                      size: 14,
                                                      color: Color(0xFFE4626F),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        final url = Uri.parse(
                                                            'https://admin.edyone.site/api/cart/remove-course');
                                                        final response =
                                                            await http.post(
                                                          url,
                                                          headers: {
                                                            'Authorization':
                                                                'Bearer fKlw0WyyLhFDZCCuwfKBBlWaREbcj8yn8xPWrVsS',
                                                            'Content-Type':
                                                                'application/json',
                                                          },
                                                          body: jsonEncode({
                                                            'cart_id':
                                                                courseDetail
                                                                    .cartId,
                                                            'course_id':
                                                                courseDetail
                                                                    .courseId,
                                                          }),
                                                        );

                                                        print(
                                                            'Response status: ${response.statusCode}');
                                                        print(
                                                            'Response body: ${response.body}');

                                                        final message;
                                                        if (response
                                                                .statusCode ==
                                                            200) {
                                                          final data =
                                                              jsonDecode(
                                                                  response
                                                                      .body);
                                                          if (data['status']) {
                                                            message =
                                                                'Course removed successfully!';
                                                            setState(() {
                                                              // Update your state here if necessary, e.g., remove the item from the list
                                                            });
                                                          } else {
                                                            message = data[
                                                                    'message'] ??
                                                                'Failed to remove course';
                                                          }
                                                        } else {
                                                          message =
                                                              'Failed to remove course';
                                                        }

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content:
                                                                Text(message),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        'Remove',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 12 / 10,
                                                          color:
                                                              Color(0xFFE4626F),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
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
                            );
                          }).toList(),
                        ),
                      );
                    }
                  },
                ),

                Container(
                  width: 388, // Specified width
                  height: 86, // Specified height
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF), // Background color
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8), // Top-left border radius
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.15), // Shadow color with opacity
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
                            Padding(
                              padding: const EdgeInsets
                                  .only(), // Adjust the padding as needed
                              child: Center(
                                child: Container(
                                  width: 356 - 20, // Adjusted width
                                  height: 40, // Specified height
                                  padding: const EdgeInsets.fromLTRB(
                                      16, 11, 10, 11), // Internal padding
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                          4), // Specified border radius for top-left
                                    ),
                                    border: Border.all(
                                      color: Color(0xFFE4E4E4), // Border color
                                      width: 1, // Border width
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween, // Space between text widgets
                                    children: [
                                      Text(
                                        'Apply offer/promo code',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 16.8 / 14, // Line height
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
                                          height: 16.8 / 14, // Line height
                                          color:
                                              Color(0xFFA505D5), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    0), // Space between the container and the new row
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Space between the texts
                              children: [
                                Text(
                                  '*Promo FEST40 applied',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    height: 12 / 10, // Line height
                                    color: Color(0xFF14B11B), // Text color
                                  ),
                                ),
                                const SizedBox(
                                    width: 140), // Space between texts
                                Text(
                                  'View All Offers',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    height: 12 / 10, // Line height
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

                FutureBuilder<CartModel?>(
                  future: fetchCartDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError || !snapshot.hasData) {
                      return Center(child: Text('Error loading cart details'));
                    } else {
                      // Extract price summary details from the API response
                      final priceSummary =
                          snapshot.data!.data.original.priceSummary;

                      return Container(
                        width: 388, // Specified width
                        height: 300, // Specified height
                        margin: const EdgeInsets.only(
                            top: 10), // Adjust this as needed
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF), // Background color
                          borderRadius: const BorderRadius.only(
                            topLeft:
                                Radius.circular(8), // Top-left border radius
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.15), // Shadow color with opacity
                              spreadRadius: 0,
                              blurRadius: 20, // Blur radius for shadow
                              offset: const Offset(0, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              16.0), // Padding inside the container
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price Details',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 16.8 / 14,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              Container(
                                width: 357, // Fixed width
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.symmetric(),
                                decoration: BoxDecoration(
                                  color: Colors.transparent, // Background color
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Price Details Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Price Details',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 16.8 / 14,
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                        Text(
                                          '₹ ${priceSummary.subtotal}', // Dynamic price value
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 16.8 / 14,
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10), // Space between rows

                                    // Discount Applied Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Discount Applied',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 16.8 / 14,
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                        Text(
                                          '₹ ${priceSummary.discountsApplied}', // Dynamic discount value
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 16.8 / 14,
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10), // Space between rows

                                    // Promo Code Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Promo Code',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 16.8 / 14,
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                        Text(
                                          priceSummary.promoCode != null
                                              ? '₹ ${priceSummary.promoCode}'
                                              : 'None', // Dynamic promo code value
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 16.8 / 14,
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10), // Space between rows

                                    // Subtotal Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Subtotal',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 16.8 / 14,
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                        Text(
                                          '₹ ${priceSummary.subtotal}', // Dynamic subtotal value
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 16.8 / 14,
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10), // Space between rows

                                    // GST Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'GST 18%',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 16.8 / 14,
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                        Text(
                                          '₹ ${priceSummary.gst}', // Dynamic GST value
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 16.8 / 14,
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20), // Space between rows

                                    // Total Amount Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total Amount',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            height: 16.8 / 14,
                                            color: Color(0xFF1B1B1B),
                                          ),
                                        ),
                                        Text(
                                          '₹ ${priceSummary.totalAmount}', // Dynamic total amount value
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            height: 16.8 / 14,
                                            color: Color(0xFF1B1B1B),
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
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          FutureBuilder<CartModel?>(
            future: fetchCartDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError || !snapshot.hasData) {
                return Center(child: Text('Error loading cart details'));
              } else {
                // Extract price summary details from the API response
                final priceSummary = snapshot.data!.data.original.priceSummary;

                return Align(
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                '₹ ${priceSummary.totalAmount}',
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
                              topRight:
                                  Radius.circular(6), // Rounded top-left corner
                              bottomLeft:
                                  Radius.circular(6), // Rounded top-left corner
                              bottomRight:
                                  Radius.circular(6), // Rounded top-left corner
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Proceed to Checkout',
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
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
