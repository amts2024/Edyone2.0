import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
                    'Privacy Policy', // The text you want to display next to the icon
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              // You can add more children here as needed
              const SizedBox(height: 20), // Add some space below the previous text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Introduction",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18, // Calculating line height
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:25),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Edyone ('we,' 'us,' or 'our') is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application ('App'). If you do not agree with the terms of this Privacy Policy, please do not access the App.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Information We Collect",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18,
                    // Calculating line height
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:25),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "We may collect and process the following types of information:",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                child: Text(
                  "Personal Information",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,fontFamily: 'Poppins',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Account Information: : ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: " When you create an account, we collect your name, email address, grade level, and school information.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Profile Information:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "You may choose to add additional information to your profile, such as a profile picture or bio.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                child: Text(
                  "Non-Personal Information",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,fontFamily: 'Poppins',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Usage Data: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "We collect information about your interactions with the App, such as the courses you view, your progress in these courses, and other usage statistics.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Device Information:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "We collect information about the device you use to access the App, including IP address, device type, operating system, and browser type.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                child: Text(
                  "Cookies and Tracking Technologies",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18, // Calculating line height
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "We use cookies and similar tracking technologies to track the activity on our App and hold certain information. Cookies are files with a small amount of data that are stored on your device.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                child: Text(
                  "How We Use Your Information",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18, // Calculating line height
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "We use the information we collect in the following ways:",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "To Provide and Maintain Our App:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600, fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "To provide you with the services and features available through our App.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "To Improve Our App:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: " To understand how users interact with our App and to make improvements.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "To Communicate with You:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,    fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "To send you updates, notifications, and other information related to your use of the App.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "To Ensure Safety and Security: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,    fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: " To monitor and ensure the security of our App and its users.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                child: Text(
                  "Sharing Your Information",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18, // Calculating line height
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "We do not sell or rent your personal information to third parties. We may share your information in the following situations:",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "With Service Providers: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "We may share your information with third-party service providers who perform services on our behalf, such as hosting, data analysis, and customer service",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "For Legal Reasons",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "We may disclose your information if required to do so by law or in response to valid requests by public authorities.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Business Transfers:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,    fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: " If we are involved in a merger, acquisition, or asset sale, your information may be transferred as part of that transaction.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Security of Your Information",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18, // Calculating line height
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:25),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "We use administrative, technical, and physical security measures to protect your personal information. However, no method of transmission over the internet or method of electronic storage is 100% secure, and we cannot guarantee absolute security.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                child: Text(
                  "Your Data Protection Rights",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18, // Calculating line height
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Depending on your location, you may have the following rights regarding your personal information:",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Access:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,  fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: " You have the right to request a copy of your personal information.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Correction:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,    fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "  You have the right to request that we correct any information you believe is inaccurate.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Deletion:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,  fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "You have the right to request that we delete your personal information under certain conditions.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Restriction:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,  fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: " You have the right to request that we restrict the processing of your personal information under certain conditions.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Portability:",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,  fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: " You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:20),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "To exercise these rights, please contact us at ",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                              children: [
                                TextSpan(
                                  text: " support@edyone.com",
                                  style: TextStyle(
                                    color: Color(0xFF3E8BFD),
                                    fontWeight: FontWeight.normal,
                                    height: 28.8 / 18, // Calculating line height
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Children's Privacy",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18, // Calculating line height
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:25),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Our App is intended for use by students from grades 1 to 12. We comply with the Children's Online Privacy Protection Act (COPPA) and other applicable laws. If you are under 13, you must have permission from a parent or guardian to use the App. We do not knowingly collect personal information from children under 13 without verifiable parental consent. If we learn that we have collected personal information from a child under 13 without such consent, we will delete that information promptly.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Changes to This Privacy Policy",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18, // Calculating line height
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:25),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy within the App. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                child: Text(
                  "Contact Us",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18, // Calculating line height
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical:0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "If you have any questions or concerns about this Privacy Policy, please contact us at:",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18, // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Row(

                  children: [
                    const Align(
                      alignment: Alignment.bottomCenter, // Aligns the CircleAvatar with the top of the text
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF000000),
                        radius: 3,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Email: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,  fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "support@edyone.com",
                              style: TextStyle(
                                color: Color(0xFF3E8BFD),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Row(

                  children: [
                    const Align(
                      alignment: Alignment.bottomCenter, // Aligns the CircleAvatar with the top of the text
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF000000),
                        radius: 3,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Address: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,    fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "[Your Company Name]",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
