import 'package:flutter/material.dart';

import 'Unitle_pages/Contactus_form.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
                  const SizedBox(
                      width: 8), // Optional spacing between icon and text
                  const Text(
                    'Contact Us', // The text you want to display next to the icon
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  height:
                      10), // Add some spacing between the icon and the next container
              Container(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.center, // Center the image
                child: Image.asset(
                  'assets/images/contactus.png',
                  width: 206, // Set the image width
                  height: 206, // Set the image height
                  fit: BoxFit.contain, // Maintain aspect ratio without cropping
                ),
              ),
              // You can add more children here as needed
              Container(
                margin: const EdgeInsets.only(top: 0, left: 10, right: 10),
                padding: const EdgeInsets.fromLTRB(48, 0, 48, 0),
                width: 388,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFF5445A2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // This will distribute the images evenly
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Mail image clicked");
                        // Add your logic for mail image click here
                      },
                      child: Image(
                        image: AssetImage(
                            'assets/icon/mail.png'), // Replace with your image path
                        width: 50, // Adjust width as needed
                        height: 50, // Adjust height as needed
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("WhatsApp image clicked");
                        // Add your logic for WhatsApp image click here
                      },
                      child: Image(
                        image: AssetImage(
                            'icon/whatsapp.png'), // Replace with your image path
                        width: 50, // Adjust width as needed
                        height: 50, // Adjust height as needed
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     print("Telephone image clicked");
                    //     // Add your logic for telephone image click here
                    //   },
                    //   child: Image(
                    //     image: AssetImage(
                    //         'icon/telephone.png'), // Replace with your image path
                    //     width: 50, // Adjust width as needed
                    //     height: 50, // Adjust height as needed
                    //   ),
                    // ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                padding: const EdgeInsets.fromLTRB(11.5, 4, 11.5, 4),
                width: 388,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEDDF7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 2), // Adjust spacing as needed
                    Text(
                      "Contact Information",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ), // Your text widget
                  ],
                ),
              ),

              const SizedBox(height: 11), // Add some spacing before the new row
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 100, // Set a fixed width for the colored text box
                      child: const Text(
                        "Websitet:",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF5445A2),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 20), // Space between the two text widgets
                    const Expanded(
                      child: Text(
                        "www.edyone.com",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF3E3E3E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 11), // Add some spacing before the new row
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 100, // Set a fixed width for the colored text box
                      child: const Text(
                        "Email:",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF5445A2),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 20), // Space between the two text widgets
                    const Expanded(
                      child: Text(
                        "support@edyone.com",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF3E3E3E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 11), // Add some spacing before the new row

              Container(
                margin: const EdgeInsets.only(top: 11, left: 10, right: 10),
                padding: const EdgeInsets.fromLTRB(11.5, 4, 11.5, 4),
                width: 388,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEDDF7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 2), // Adjust spacing as needed
                    Text(
                      "Social",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ), // Your text widget
                  ],
                ),
              ),
              const SizedBox(height: 11), // Add some spacing before the new row
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Row(
                  children: [
                    Container(
                      width: 50, // Set a fixed width for the colored text box
                      child: Image.asset(
                        'assets/icon/instagram.png', // Replace with your image path
                        width: 22, // Adjust width as needed
                        height: 22, // Adjust height as needed
                      ),
                    ),
                    const SizedBox(
                        width: 60), // Space between the image and text
                    const Expanded(
                      child: Text(
                        "@edyone",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF7762FA),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Row(
                  children: [
                    Container(
                      width: 50, // Set a fixed width for the colored text box
                      child: Image.asset(
                        'assets/icon/linkedin.png', // Replace with your image path
                        width: 22, // Adjust width as needed
                        height: 22, // Adjust height as needed
                      ),
                    ),
                    const SizedBox(
                        width: 60), // Space between the image and text
                    const Expanded(
                      child: Text(
                        "@edyone",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF7762FA),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Row(
                  children: [
                    Container(
                      width: 50, // Set a fixed width for the colored text box
                      child: Image.asset(
                        'assets/icon/twitter.png', // Replace with your image path
                        width: 22, // Adjust width as needed
                        height: 22, // Adjust height as needed
                      ),
                    ),
                    const SizedBox(
                        width: 60), // Space between the image and text
                    const Expanded(
                      child: Text(
                        "@edyone",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF7762FA),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 25, // Set a fixed width for the colored text box
                      child: Image.asset(
                        'icon/facebook.png', // Replace with your image path
                        width: 22, // Adjust width as needed
                        height: 22, // Adjust height as needed
                      ),
                    ),
                    const SizedBox(
                        width: 60), // Space between the image and text
                    const Expanded(
                      child: Text(
                        "fb.com/edyone",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF7762FA),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      child: Image.asset(
                        'icon/youtube.png', // Replace with your image path
                        width: 22, // Adjust width as needed
                        height: 22, // Adjust height as needed
                      ),
                    ),
                    const SizedBox(
                        width: 60), // Space between the image and text
                    const Expanded(
                      child: Text(
                        "yt.com/edyone1",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF7762FA),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 11, left: 10, right: 10),
                padding: const EdgeInsets.fromLTRB(11.5, 4, 11.5, 4),
                width: 388,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEDDF7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 2), // Adjust spacing as needed
                    Text(
                      "Raise a Question",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ), // Your text widget
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 14, left: 10, right: 10),
                child: const Text(
                  "Email us below to ask or book a free consult with the red button for more times please email.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF3E3E3E),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Contactusform(),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
