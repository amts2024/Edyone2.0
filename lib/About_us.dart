import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                    'About Us', // The text you want to display next to the icon
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
                      20), // Add some spacing between the icon and the next container
              Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center, // Center the image
                child: Image.asset(
                  'assets/images/dd.png',
                  width: 113.54, // Set the image width
                  height: 92.4, // Set the image height
                  fit: BoxFit.contain, // Maintain aspect ratio without cropping
                ),
              ),
              const SizedBox(
                  height: 0), // Add some spacing between the image and the text
              Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/edugur.png',
                  width: 219, // Set the image width
                  height: 70.4, // Set the image height
                  fit: BoxFit.contain, // Maintain aspect ratio without cropping
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.center,
                child: const Text(
                  'The Platform of Opportunities',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.56,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF170F49),
                    height: 21.84 / 14.56, // Calculating line height,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
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

              Container(
                  margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  padding: const EdgeInsets.fromLTRB(11.5, 4, 11.5, 5),
                  width: double.infinity,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEDDF7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            Color(0xFF000000), // Change color as needed
                        radius: 4, // Adjust size as needed
                      ),
                      SizedBox(width: 8), // Adjust spacing as needed
                      Text(
                        "What is Edugur",
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ), // Your text widget
                    ],
                  )),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: const Text(
                      'Lorem ipsum dolor sit amet consectetur. Tincidunt urna eget nec eget fermentum gravida. Netus cras enim viverra non mauris sapien a ullamcorper. Ipsum phasellus sed elementum proin mauris quisque et justo risus. Sed egestas sed et et. Molestie eu id vestibulum pellentesque augue in tempus vitae. Eu cursus curabitur tellus sollicitudin turpis. In mattis nunc feugiat sit. Consectetur dictum sem nulla sed.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 19.6 / 14, // Calculate line height
                        letterSpacing: 0.01, // Adjust letter spacing as needed
                        color: Colors.black, // Adjust color as needed
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  padding: const EdgeInsets.fromLTRB(11.5, 4, 11.5, 5),
                  width: double.infinity,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEDDF7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            Color(0xFF000000), // Change color as needed
                        radius: 4, // Adjust size as needed
                      ),
                      SizedBox(width: 8), // Adjust spacing as needed
                      Text(
                        "Our Purpose",
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ), // Your text widget
                    ],
                  )),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur. Tincidunt urna eget nec eget fermentum gravida. Netus cras enim viverra non mauris sapien a ullamcorper. Ipsum phasellus sed elementum proin mauris quisque et justo risus. Sed egestas sed et et. Molestie eu id vestibulum pellentesque augue in tempus vitae. Eu cursus curabitur tellus sollicitudin turpis. In mattis nunc feugiat sit. Consectetur dictum sem nulla sed.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 19.6 / 14, // Calculate line height
                        letterSpacing: 0.01, // Adjust letter spacing as needed
                        color: Colors.black, // Adjust color as needed
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  padding: const EdgeInsets.fromLTRB(11.5, 4, 11.5, 5),
                  width: double.infinity,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEDDF7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            Color(0xFF000000), // Change color as needed
                        radius: 4, // Adjust size as needed
                      ),
                      SizedBox(width: 8), // Adjust spacing as needed
                      Text(
                        "Our Approach",
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ), // Your text widget
                    ],
                  )),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur. Tincidunt urna eget nec eget fermentum gravida. Netus cras enim viverra non mauris sapien a ullamcorper. Ipsum phasellus sed elementum proin mauris quisque et justo risus. Sed egestas sed et et. Molestie eu id vestibulum pellentesque augue in tempus vitae. Eu cursus curabitur tellus sollicitudin turpis. In mattis nunc feugiat sit. Consectetur dictum sem nulla sed.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 19.6 / 14, // Calculate line height
                        letterSpacing: 0.01, // Adjust letter spacing as needed
                        color: Colors.black, // Adjust color as needed
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
