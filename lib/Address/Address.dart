import 'package:flutter/material.dart';

import 'UpdateAddress.dart';


class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0.0),
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
                    'Address',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Adds space between the sections

              Container(
                width: 388, // Fill width to 388px
                height: 47,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF70747E), // Border color #232323
                      width: 1, // Border height 1px
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'House No 2',
                    style: TextStyle(
                      fontFamily: 'Poppins', // Font-family: Poppins
                      fontSize: 18, // Font-size: 18px
                      fontWeight: FontWeight.w500, // Font-weight: 500
                      height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                      letterSpacing: 0.01, // Letter-spacing: 0.01em
                      color: Color(0xFF70747E), // Text-color: #232323
                    ),
                    textAlign: TextAlign.left, // Text-align: left
                  ),
                ),
              ),
              SizedBox(height: 20), // Adds space between the sections

              Container(
                width: 388, // Fill width to 388px
                height: 47,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF70747E), // Border color #232323
                      width: 1, // Border height 1px
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Brij Vihar Colony',
                    style: TextStyle(
                      fontFamily: 'Poppins', // Font-family: Poppins
                      fontSize: 18, // Font-size: 18px
                      fontWeight: FontWeight.w500, // Font-weight: 500
                      height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                      letterSpacing: 0.01, // Letter-spacing: 0.01em
                      color: Color(0xFF70747E), // Text-color: #232323
                    ),
                    textAlign: TextAlign.left, // Text-align: left
                  ),
                ),
              ),
              SizedBox(height: 20), // Adds space between the sections

              Container(
                width: 388, // Fill width to 388px
                height: 47,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF70747E), // Border color #232323
                      width: 1, // Border height 1px
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Brij Vihar Colony Jattari Khair Aligarh',
                    style: TextStyle(
                      fontFamily: 'Poppins', // Font-family: Poppins
                      fontSize: 18, // Font-size: 18px
                      fontWeight: FontWeight.w500, // Font-weight: 500
                      height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                      letterSpacing: 0.01, // Letter-spacing: 0.01em
                      color: Color(0xFF70747E), // Text-color: #232323
                    ),
                    textAlign: TextAlign.left, // Text-align: left
                  ),
                ),
              ),
              SizedBox(height: 20), // Adds space between the sections

              Container(
                width: 388, // Fill width to 388px
                height: 47,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF70747E), // Border color #232323
                      width: 1, // Border height 1px
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Near Khatoo Shyam Mandir',
                    style: TextStyle(
                      fontFamily: 'Poppins', // Font-family: Poppins
                      fontSize: 18, // Font-size: 18px
                      fontWeight: FontWeight.w500, // Font-weight: 500
                      height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                      letterSpacing: 0.01, // Letter-spacing: 0.01em
                      color: Color(0xFF70747E), // Text-color: #232323
                    ),
                    textAlign: TextAlign.left, // Text-align: left
                  ),
                ),
              ),
              SizedBox(height: 20), // Adds space between the sections


              Container(
                width: 388, // Fill width to 388px
                height: 47,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF70747E), // Border color #232323
                      width: 1, // Border height 1px
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '202137',
                    style: TextStyle(
                      fontFamily: 'Poppins', // Font-family: Poppins
                      fontSize: 18, // Font-size: 18px
                      fontWeight: FontWeight.w500, // Font-weight: 500
                      height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                      letterSpacing: 0.01, // Letter-spacing: 0.01em
                      color: Color(0xFF70747E), // Text-color: #232323
                    ),
                    textAlign: TextAlign.left, // Text-align: left
                  ),
                ),
              ),
              SizedBox(height: 20), // Adds space between the sections

              Container(
                width: 388, // Fill width to 388px
                height: 47,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF70747E), // Border color #232323
                      width: 1, // Border height 1px
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Uttar Pradesh',
                    style: TextStyle(
                      fontFamily: 'Poppins', // Font-family: Poppins
                      fontSize: 18, // Font-size: 18px
                      fontWeight: FontWeight.w500, // Font-weight: 500
                      height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                      letterSpacing: 0.01, // Letter-spacing: 0.01em
                      color: Color(0xFF70747E), // Text-color: #232323
                    ),
                    textAlign: TextAlign.left, // Text-align: left
                  ),
                ),
              ),
              SizedBox(height: 20), // Adds space between the sections

              Container(
                width: 388, // Fill width to 388px
                height: 47,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF70747E), // Border color #232323
                      width: 1, // Border height 1px
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Aligarh',
                    style: TextStyle(
                      fontFamily: 'Poppins', // Font-family: Poppins
                      fontSize: 18, // Font-size: 18px
                      fontWeight: FontWeight.w500, // Font-weight: 500
                      height: 27 / 18, // Line-height: 27px (calculated as line-height/font-size)
                      letterSpacing: 0.01, // Letter-spacing: 0.01em
                      color: Color(0xFF70747E), // Text-color: #232323
                    ),
                    textAlign: TextAlign.left, // Text-align: left
                  ),
                ),
              ),

              SizedBox(height: 20), // Adds space between the sections
              Container(
                width: 388,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Simplified border radius
                  gradient: LinearGradient(
                    colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Submit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 1.2, // Equivalent to line-height
                          letterSpacing: 0.01,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Adds space between the sections





              //UpdateAddrerss(),

            ],
          ),
        ),
      ),
    );
  }
}
