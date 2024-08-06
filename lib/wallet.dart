import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB( 10.0, 20.0, 10.0, 0.0),
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
                    'Wallet', // The text you want to display next to the icon
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Color(0xFF0B121F)
                    ),
                  ),
                ],
              ),
              Container(
                width: 388,
                height: 131,
                margin: const EdgeInsets.only(top: 30, left: 10,right: 10),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFA10048),
                      Color(0xFF2300FF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Wallet Balance',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 5), // Space between the two lines of text
                        Text(
                          '₹450',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Colors.white
                          ),
                        ),
                        Text(
                          'You can add upto ₹50,000 ',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 10.45,
                              color: Color(0xFFD6D6D6)

                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'icon/rupee.png', // Your image asset path
                      width: 92,
                      height: 71,
                    ),

                  ],
                ),
              ),
              Container(
                width: 387,
                height: 42,
                margin: const EdgeInsets.only(top: 16, left: 10,right: 10),
                padding: const EdgeInsets.fromLTRB(11.5, 3, 11.5, 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.currency_rupee, // Rupee symbol icon
                      color: Color(0xFF5F5F5F), // Icon color
                      size: 14, // Icon size
                    ),

                    SizedBox(width: 8), // Spacing between icon and input box
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Amount', // Placeholder text
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 320,
                  height: 40,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                    boxShadow: [BoxShadow(color: Colors.transparent)], // Remove shadow
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button onPressed logic here
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        // Define the button colors based on its state
                        if (states.contains(MaterialState.pressed)) {
                          // When pressed
                          return const Color(0xFF17C16A); // Change color to the pressed color
                        } else {
                          // Default color
                          return const Color(0xFF17C16A); // Change color to the default color
                        }
                      }),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Add to Wallet',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ),
              const SizedBox(height: 0),

              Container(
                margin: const EdgeInsets.only(top: 20, left: 10,right: 10),
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: const Color(0xFF000000).withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 0),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 21.6 / 18, // Calculating line height
                    color: Colors.black, // Assuming the text color is black
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                width: 390,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  border: Border.all(
                    color: const Color(0xFFEBEBEB),
                    width: 0.5,
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Add your widgets here
                    // Assuming you have an image asset named 'right_image.png' in your assets
                    Image.asset(
                      'icon/bill.png',
                      width: 40, // Adjust the width according to your design
                      height: 40, // Adjust the height according to your design
                      fit: BoxFit.cover,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Course Purchased',
                          style: TextStyle(
                            fontSize: 14, // Adjust the font size as needed
                            fontWeight: FontWeight.w500, // Adjust the font weight as needed
                            color: Color(0xFF5F5F5F), // Adjust the color as needed
                          ),
                        ),Row(
                          children: [
                            Text(
                              'STID: 2345678909',
                              style: TextStyle(
                                fontSize: 10, // Adjust the font size as needed
                                color: Color(0xFFC2C2C2),
                                fontWeight: FontWeight.w400, // Adjust the font weight as needed
                                // Adjust the color as needed
                              ),
                            ),
                            const SizedBox(width: 10), // Adjust the spacing between the two text widgets
                            Text(
                              'Date: 25-5-2024',
                              style: TextStyle(
                                fontSize: 10, // Adjust the font size as needed
                                color: Color(0xFFC2C2C2),
                                fontWeight: FontWeight.w400, // Adjust the font weight as needed
                                // Adjust the color as needed
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          '-₹',
                          style: TextStyle(
                            fontSize: 14, // Adjust the font size as needed
                            fontWeight: FontWeight.w400, // Adjust the font weight as needed
                            color: Color(0xFFC03744), // Adjust the color as needed

                          ),
                        ),
                        SizedBox(width: 3), // Adjust the spacing between the two text widgets
                        Text(
                          '500',
                          style: TextStyle(
                            fontSize: 14, // Adjust the font size as needed
                            fontWeight: FontWeight.w600, // Adjust the font weight as needed
                            color: Color(0xFFC03744), // Adjust the color as needed
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 0),

              Container(
                margin: const EdgeInsets.only(top: 14, left: 10, right: 10),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                width: 390,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  border: Border.all(
                    color: const Color(0xFFEBEBEB),
                    width: 0.5,
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Add your widgets here
                    // Assuming you have an image asset named 'right_image.png' in your assets
                    Image.asset(
                      'icon/bill.png',
                      width: 40, // Adjust the width according to your design
                      height: 40, // Adjust the height according to your design
                      fit: BoxFit.cover,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Money Added to Wallet',
                          style: TextStyle(
                            fontSize: 14, // Adjust the font size as needed
                            fontWeight: FontWeight.w500, // Adjust the font weight as needed
                            color: Color(0xFF5F5F5F), // Adjust the color as needed
                          ),
                        ),Row(
                          children: [
                            Text(
                              'STID: 2345678909',
                              style: TextStyle(
                                fontSize: 10, // Adjust the font size as needed
                                color: Color(0xFFC2C2C2),
                                fontWeight: FontWeight.w400, // Adjust the font weight as needed
                                // Adjust the color as needed
                              ),
                            ),
                            const SizedBox(width: 10), // Adjust the spacing between the two text widgets
                            Text(
                              'Date: 25-5-2024',
                              style: TextStyle(
                                fontSize: 10, // Adjust the font size as needed
                                color: Color(0xFFC2C2C2),
                                fontWeight: FontWeight.w400, // Adjust the font weight as needed
                                // Adjust the color as needed
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          '-₹',
                          style: TextStyle(
                            fontSize: 14, // Adjust the font size as needed
                            fontWeight: FontWeight.w400, // Adjust the font weight as needed
                            color: Color(0xFF17C16A), // Adjust the color as needed

                          ),
                        ),
                        SizedBox(width: 3), // Adjust the spacing between the two text widgets
                        Text(
                          '500',
                          style: TextStyle(
                            fontSize: 14, // Adjust the font size as needed
                            fontWeight: FontWeight.w600, // Adjust the font weight as needed
                            color: Color(0xFF17C16A), // Adjust the color as needed
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
    );
  }

  void _verifyOTP() {
    // Implement OTP verification logic here
  }
}
