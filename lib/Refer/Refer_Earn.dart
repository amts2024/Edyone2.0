import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // Import this for Clipboard

class Refer_Earn extends StatefulWidget {
  const Refer_Earn({Key? key}) : super(key: key);

  @override
  State<Refer_Earn> createState() => _ReferEarnState();
}

class _ReferEarnState extends State<Refer_Earn> {
  final double paddingSize = 10.0; // Define padding size for reuse
  final double containerHeightFixed = 56.0; // Define a fixed height for containers
  final double textSize = 16.0; // Define a responsive text size
  final double earnings = 100.50; // Example earnings value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
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
                    'Refer & Earn',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Space between the title and the image
              Center(
                child: Opacity(
                  opacity: 0.9, // Optional opacity as per your requirement
                  child: Container(
                    width: 277.91, // Image width
                    height: 227, // Image height
                    child: Image.asset(
                      'icon/Asset12.png', // Replace with your image asset path
                      fit: BoxFit.cover, // Adjust image fitting as per requirement
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between image and new layout
              Container(
                width: 388, // Outer layout width
                height: 207, // Outer layout height
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4CC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure the child takes full width
                  children: [
                    Container(
                      width: double.infinity, // Full width container
                      height: 56, // Inner layout height
                      padding: const EdgeInsets.symmetric(horizontal: 99, vertical: 9), // Padding for inner layout
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFAB07),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Refer & Earn',
                          style: TextStyle(
                            fontFamily: 'Potta One',
                            fontSize: 26.13,
                            fontWeight: FontWeight.w400,
                            height: 37.83 / 26.13, // Corrected line height factor
                            letterSpacing: 0.01,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(paddingSize), // Padding inside the RichText container
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: textSize, // Responsive text size
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Default text color
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Refer your friends & get ', // Normal text
                              style: TextStyle(
                                color: Colors.black, // Set color to black
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                                fontFamily: 'Poppins',
                                height: 24/16,
                              ),
                            ),

                            TextSpan(
                              text: '\n10% cashback ',
                              style: TextStyle(
                                color: Color(0xFF1F25B3),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                                fontFamily: 'Poppins',
                                height: 28.5/19,
                                fontSize: 19,
                              ),
                            ),
                            TextSpan(
                              text: 'in your wallet',
                              style: TextStyle(
                                color: Colors.black, // Set color to black
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                                fontFamily: 'Poppins',
                                height: 24/16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                        paddingSize), // Space between the RichText and the Total Earnings section
                    Center(
                      child: Container(
                        width: 251,
                        height: 42,
                        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 22.36),
                        decoration: BoxDecoration(
                          color: const Color(0xFF189416),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(33),
                            topRight: Radius.circular(33),
                            bottomLeft: Radius.circular(33),
                            bottomRight: Radius.circular(33),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Earnings:',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                height: 1.5, // 27px / 18px = 1.5
                                letterSpacing: 0.01,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 19.4,
                                  height: 19.4,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBC63A),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '₹',
                                      style: TextStyle(
                                        fontSize: 12, // Adjust the size if needed
                                        color: Colors.white,

                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5), // Adjust the gap if needed
                                Text(
                                  '500',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    height: 25.2/21, // 27px / 18px = 1.5
                                    letterSpacing: 0.01,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),

                    ),



                    SizedBox(
                        height:
                        paddingSize), // Space between the Total Earnings and the referral code section
                  ],
                ),


              ),
              Container(
                padding: EdgeInsets.all(paddingSize),
                child: Center(
                  child: Text(
                    'Refer Code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000),
                      fontFamily: 'Poppins',
                      height: 19.2/16,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Column(
                children: [
                  // Existing container
                  Container(
                    width: 388,
                    height: 48,
                    margin: const EdgeInsets.only(),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'AM123456EDY',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.2, // 19.2px / 16px = 1.2
                                letterSpacing: 0.01,
                                color: Color(0xFF616161),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: 'AM123456EDY'));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Copied to clipboard')),
                                );
                              },
                              child: Container(
                                width: 48,
                                height: 48,
                                padding: const EdgeInsets.all(12),
                                child: Icon(
                                  Icons.copy,
                                  color: Color(0xFF4F8FDA),
                                ),
                              ),
                            ),
                            const SizedBox(width: 1), // Small gap between the two icons
                            Container(
                              width: 48,
                              height: 48,
                              padding: const EdgeInsets.all(12),
                              color: const Color(0xFF4F8FDA),
                              child: Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // New layout with "Referral Link" and "Copy Link"
                  Container(
                    width: 388,
                    height: 48,
                    margin: const EdgeInsets.only(top: 8), // Adjust the spacing as needed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side: "Referral Link" text
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Referral Link',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 1.2, // 21.6px / 18px = 1.2
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        // Right side: "Copy Link" text
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),

                          child: Text(
                            'Copy Link',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.2, // 16.8px / 14px = 1.2
                              color: Color(0xFF0057FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                width: 388,
                height: 71,
                margin: const EdgeInsets.only(),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'https://www.figma.com/design/99kW1MPPO6tgzK97'
                          'LodC3/Edyone?node-id=1029-874&t=nPe7zP6qZ81'
                        'Ara4k-1',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 18.8/16, // 19.2px / 16px = 1.2
                            letterSpacing: 0.01,
                            color: Color(0xFF2F76FF),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 20), // Space between the title and the image
              Center(
                child: Opacity(
                  opacity: 0.9, // Optional opacity as per your requirement
                  child: Container(
                    width: 157, // Image width
                    height: 43, // Image height
                    child: Image.asset(
                      'icon/hiw.png', // Replace with your image asset path
                      fit: BoxFit.cover, // Adjust image fitting as per requirement
                    ),
                  ),
                ),
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FAQs text
                  Container(
                    padding: EdgeInsets.all(8.0), // Adjust padding as needed
                    child: Center(
                      child: Text(
                        'FAQs',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0057FF),
                          fontFamily: 'Poppins',
                          height: 18 / 15,
                          letterSpacing: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16), // Adjust spacing as needed

                  // Referral Link and All dropdown
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side: Referral Link text
                      Expanded(
                        child: Text(
                          'Referral History',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 21.6 / 18, // line-height: 21.6px / font-size: 18px
                            color: Colors.black,
                          ),
                        ),
                      ),

                      // Right side: All dropdown
                      Container(
                        width: 76,
                        height: 24,
                        padding: const EdgeInsets.fromLTRB(7, 2, 7, 1), // Adjust padding as needed
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(3),
                          ),
                          border: Border.all(
                            color: const Color(0xFFBDBDBD),
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'All',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 16,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                children: [
                  const SizedBox(height: 12), // Add spacing as needed

                  // Outer Container (Parent Layout)
                  Container(
                    width: 390,
                    padding: EdgeInsets.all(12), // Adjust padding as needed
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8), // Combined all corners with same radius
                      border: Border.all(
                        color: Color(0xFFEBEBEB), // Border color
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Inner Container (Nested Layout)
                        Container(
                          width: 390,
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0), // Adjust padding as needed
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              // Left Circular Layout with Image
                              Container(
                                width: 44,
                                height: 44,
                                padding: EdgeInsets.all(10), // Adjust padding as needed
                                decoration: BoxDecoration(
                                  color: Color(0xFF17C16A), // Success color
                                  borderRadius: BorderRadius.circular(36), // Circular shape
                                ),
                                child: Image.asset(
                                  'icon/Vector(1).png', // Replace with your image path
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              const SizedBox(width: 10), // Spacing between image and text

                              // Right Text Layout
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Saumy Verma',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 16.8 / 14, // line-height: 16.8px / font-size: 14px
                                        color: Color(0xFF5F5F5F), // Text color
                                      ),
                                    ),
                                    const SizedBox(height: 4), // Add some space between the name and the new layout

                                    // New Layout below "Saumy Verma"
                                    Row(
                                      children: [
                                        // Small Circular Layout
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF17C16A), // Success color
                                            borderRadius: BorderRadius.circular(36), // Circular shape
                                          ),
                                        ),
                                        const SizedBox(width: 8), // Spacing between the circle and the text

                                        // "Success" Text
                                        Text(
                                          'Success',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            height: 12 / 10, // line-height: 12px / font-size: 10px
                                            color: Color(0xFFC2C2C2), // Text color
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // + ₹ 500 Text on the right side
                              Text(
                                '+ ₹ 500',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 16.8 / 14, // line-height: 16.8px / font-size: 14px
                                  color: Color(0xFF17C16A), // Success color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 6), // Add spacing as needed
                  Container(
                    width: 390,
                    padding: EdgeInsets.all(12), // Adjust padding as needed
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8), // Combined all corners with same radius
                      border: Border.all(
                        color: Color(0xFFEBEBEB), // Border color
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Inner Container (Nested Layout)
                        Container(
                          width: 390,
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0), // Adjust padding as needed
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              // Left Circular Layout with Image
                              Container(
                                width: 44,
                                height: 44,
                                padding: EdgeInsets.all(10), // Adjust padding as needed
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFA927), // Success color
                                  borderRadius: BorderRadius.circular(36), // Circular shape
                                ),
                                child: Image.asset(
                                  'icon/Vector(1).png', // Replace with your image path
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              const SizedBox(width: 10), // Spacing between image and text

                              // Right Text Layout
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amit Sharma',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 16.8 / 14, // line-height: 16.8px / font-size: 14px
                                        color: Color(0xFF5F5F5F), // Text color
                                      ),
                                    ),
                                    const SizedBox(height: 4), // Add some space between the name and the new layout

                                    // New Layout below "Saumy Verma"
                                    Row(
                                      children: [
                                        // Small Circular Layout
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFA927), // Success color
                                            borderRadius: BorderRadius.circular(36), // Circular shape
                                          ),
                                        ),
                                        const SizedBox(width: 8), // Spacing between the circle and the text

                                        // "Success" Text
                                        Text(
                                          'Pending',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            height: 12 / 10, // line-height: 12px / font-size: 10px
                                            color: Color(0xFFC03744), // Text color
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // + ₹ 500 Text on the right side
                              Text(
                                '₹ 0',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 16.8 / 14, // line-height: 16.8px / font-size: 14px
                                  color: Color(0xFFC03744), // Success color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
