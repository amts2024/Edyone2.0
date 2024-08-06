import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
                    'Terms and Conditions', // The text you want to display next to the icon
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
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
                              text: "Welcome to Edyone. By using our mobile application ('App'), you agree to be bound by these Terms and Conditions ('Terms'). If you do not agree with any part of these Terms, you must not use our App.",
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Definitions",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    height: 28.8 / 18, // Calculating line height
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
                          text: "App: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "Edyone mobile application.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
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
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(

                  children: [
                    const CircleAvatar(
                      backgroundColor: Color(0xFF000000),
                      radius: 3,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "We/Us/Our: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "Edyone and its management team.",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                child: Row(

                  children: [
                    const CircleAvatar(
                      backgroundColor: Color(0xFF000000),
                      radius: 3,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "User/You/Your: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "Any individual using the App.",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 8), // Adjust this value to fine-tune alignment
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF000000),
                          radius: 3,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Content: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "All learning materials, courses, text, graphics, images, and other resources available through the App.",
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
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
                child: Text(
                  "Use of the App",
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF000000)
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Compliance: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "You agree to use the App in compliance with all applicable laws and regulations.",
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
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("2.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF000000)
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Prohibited Activities: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: "You must not:",
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
                padding: const EdgeInsets.only(left: 30, top: 0, bottom: 0, right: 0),
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
                    SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Use the App for any unlawful purpose.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                height: 1.6, // Adjusted line height
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
                padding: const EdgeInsets.only(left: 30, top: 0, bottom: 0, right: 0),
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
                          children: [
                            TextSpan(
                              text: "Distribute viruses or any other harmful code.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                height: 28.8 / 18, // Calculating line height
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
                padding: const EdgeInsets.only(left: 30, top: 0, bottom: 0, right: 0),
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
                          children: [
                            TextSpan(
                              text: "Attempt to hack or disrupt the App.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                height: 28.8 / 18, // Calculating line height
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
                padding: const EdgeInsets.only(left: 30, top: 0, bottom: 0, right: 0),

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
                          children: [
                            TextSpan(
                              text: "Engage in any activity that may harm or exploit other users.",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                height: 28.8 / 18, // Calculating line height
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
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
                child: Text(
                  "Intellectual Property",
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("1.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF000000)
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Ownership: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: " All content provided on the App is owned by Edyone or its licensors and is protected by intellectual property laws.",
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("2.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF000000)
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Restrictions: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',

                          ),
                          children: [
                            TextSpan(
                              text: " You may not copy, modify, distribute, sell, or lease any part of our Content without prior written consent.",
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
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
                child: Text(
                  "Privacy",
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Your use of the App is also governed by our Privacy Policy, which can be accessed within the App. Please review our Privacy Policy to understand how we collect, use, and protect your information.",
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
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
                child: Text(
                  "Disclaimers and Limitation of Liability",
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
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF000000)
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Disclaimers: ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: ""
                                  "The App and all content are provided on an 'as is' basis without any warranties of any kind. We do not guarantee that the App will be error-free or uninterrupted.",
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
                    const Text("2.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF000000)
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: "Limitation of Liability:  ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: ""
                                  "To the fullest extent permitted by law, Edyone shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues.",
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
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
                child: Text(
                  "Termination",
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "We reserve the right to suspend or terminate your access to the App at any time, without notice, for conduct that we believe violates these Terms or is harmful to other users of the App, us, or third parties, or for any other reason.",
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
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
                child: Text(
                  "Changes to Terms",
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "We may update these Terms from time to time. If we make significant changes, we will notify you through the App or by other means. Your continued use of the App after such changes indicates your acceptance of the new Terms.",
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
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
                child: Text(
                  "Governing Law",
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "These Terms shall be governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflict of law principles.",
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
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "If you have any questions or concerns about these Terms, please contact us at:",
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
                padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0, right: 0),
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
                          children: [
                            TextSpan(
                              text: "Email: support@edyone.com",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 28.8 / 18, // Calculating line height
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
                padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0, right: 0),
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
                          children: [
                            TextSpan(
                              text: "Address: [Address will be changed acc to Edyone]",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 28.8 / 18, // Calculating line height
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
            ],
          ),
        ),
      ),
    );
  }
}
