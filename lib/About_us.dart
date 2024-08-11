import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _currentImageIndex = 1;
  final List<Map<String, String>> _imageData = [
    {
      'image': 'images/Shivam.jpeg',
      'caption': '',
      'designation': 'Co founder',
      'name': 'Shivam Gautam'
    },
    {
      'image': 'images/Amit.png',
      'caption': ' ',
      'designation': 'Founder & C.E.O',
      'name': 'Amit Dagur'
    },
    {
      'image': 'images/Saurabh.jpeg',
      'caption': ' ',
      'designation': 'Managing Director',
      'name': 'Saurabh Kumar'
    },
  ];

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
                  const SizedBox(width: 8),
                  const Text(
                    'About Us',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/dd.png',
                  width: 113.54,
                  height: 92.4,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 0),
              Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/edugur.png',
                  width: 219,
                  height: 70.4,
                  fit: BoxFit.contain,
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
                    height: 21.84 / 14.56,
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
                      backgroundColor: Color(0xFF000000),
                      radius: 4,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "What is Edyone ?",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'Edyone Education Private Limited is an Indian educational technology company headquartered in Jattari Aligarh Uttar Pradesh. The Company was founded by Amit Dagur in 2024. Edyone provides online tuition classes for the students who are reading in CBSE board from class 4 to 12 as of now.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 19.6 / 14,
                        letterSpacing: 0.01,
                        color: Color(0xFF848484),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'Later, we will also provide the classes and tutoring services for the other boards like UP BOARD, MP BOARD, ICSE, and others. We are also preparing to introduce COMPETITIVE and SKILL-based courses at an affordable price.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 19.6 / 14,
                        letterSpacing: 0.01,
                        color: Color(0xFF848484),
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
                      backgroundColor: Color(0xFF000000),
                      radius: 4,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Our Purpose",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: const Text(
                      'Our purpose is to improve the quality, accessibility, and affordability of education for students, teachers, and educational institutions. We are providing innovative solutions to address challenges in the education sector, such as:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 19.6 / 14,
                        letterSpacing: 0.01,
                        color: Color(0xFF848484),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(
                                top:
                                    8), // Adjust this value to fine-tune alignment
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFF848484),
                              radius: 2,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              text: "Quality: ",
                              style: TextStyle(
                                color: Color(0xFF848484),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      " By providing tools and resources to improve teaching and learning outcomes",
                                  style: TextStyle(
                                    color: Color(0xFF848484),
                                    fontWeight: FontWeight.normal,
                                    height: 28.8 / 18,
                                    // Calculating line height
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(
                                top:
                                    8), // Adjust this value to fine-tune alignment
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFF848484),
                              radius: 2,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              text: "Access: ",
                              style: TextStyle(
                                color: Color(0xFF848484),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "By making education more affordable and convenient",
                                  style: TextStyle(
                                    color: Color(0xFF848484),
                                    fontWeight: FontWeight.normal,
                                    height: 28.8 / 18,
                                    // Calculating line height
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(
                                top:
                                    8), // Adjust this value to fine-tune alignment
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFF848484),
                              radius: 2,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              text: "Skill development: ",
                              style: TextStyle(
                                color: Color(0xFF848484),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "By creating the tools and content to develop the skill mindset.",
                                  style: TextStyle(
                                    color: Color(0xFF848484),
                                    fontWeight: FontWeight.normal,
                                    height: 28.8 / 18,
                                    // Calculating line height
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(
                                top:
                                    8), // Adjust this value to fine-tune alignment
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFF848484),
                              radius: 2,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text:
                                  "The purpose of Edyone is to empower the students with education of various standards at affordable price range from rural areas to urban cities, so that the education is accessible to all.",
                              style: TextStyle(
                                color: Color(0xFF848484),
                                fontWeight: FontWeight.normal,
                                height: 28.8 / 18,
                                // Calculating line height
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ],
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
                      backgroundColor: Color(0xFF000000),
                      radius: 4,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Services on our platform",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: const Text(
                      'The platform is developing student-centric solutions for delivering learning effectively through instructional design, user friendly interface, learner analytics and quality in the content in various forms. We offer a wide range of Courses and Batches on the platform for the student. We have designed the courses to provide efficient learning to the user of a particular subject of a class while the courses provide the accessibility to the user to learn different subjects at a single place.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 19.6 / 14,
                        letterSpacing: 0.01,
                        color: Color(0xFF848484),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: const Text(
                      'We also have our referral and distributor program which helps the learners to solve the problems efficiently.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 19.6 / 14,
                        letterSpacing: 0.01,
                        color: Color(0xFF848484),
                      ),
                      textAlign: TextAlign.left,
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
                          backgroundColor: Color(0xFF000000),
                          radius: 4,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Features of our platform ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                child: const Text(
                  'We provide a wide variety of content and features on the platform for our learners. Some of them are:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.01,
                    color: Color(0xFF848484),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 8), // Set horizontal margin to 0
                // Add left padding to give space only from the left
                child: const Text(
                  '''
    • Live Classes\n
    • Recorded Classes\n
    • MCQs\n
    • Mock Tests\n
    • Live Doubt Solving\n
    • Books\n
    • DPP sheets\n
    • Notes\n
    • Referral Program and much more…''',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 10.6 / 15,
                    letterSpacing: 0.01,
                    color: Color(0xFF848484),
                  ),
                  textAlign: TextAlign.start,
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
                      backgroundColor: Color(0xFF000000),
                      radius: 4,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Our Vision",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                child: const Text(
                  'Our vision at Edyone is to reimagine and evolve the way teaching and learning have been happening for many centuries. By combining and making the perfect combination of quality teachers, engaging content and superior technology we are able to create a superior learning experience for students and learners.Edyone is a learning network where any students can learn any content anywhere in the world.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 19.6 / 14,
                    letterSpacing: 0.01,
                    color: Color(0xFF848484),
                  ),
                  textAlign: TextAlign.left,
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
                      backgroundColor: Color(0xFF000000),
                      radius: 4,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Our Presence",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                child: const Text(
                  'Currently, Edyone is in the partnership with many schools and institutions to make the education  accessible, and affordable for the students and learners.Some of the Institutions are as:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 19.6 / 14,
                    letterSpacing: 0.01,
                    color: Color(0xFF848484),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 10), // Set horizontal margin to 0
                // Add left padding to give space only from the left
                child: const Text(
                  '''
    • SHREEJI PUBLIC SCHOOL\n
    • BABUJI CONVENT SCHOOL\n
    • MD JANTA PUBLIC SCHOOL\n
    • ARCADIAN PUBLIC SCHOOL and many more….\n
  ''',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 10.6 / 14,
                    letterSpacing: 0.01,
                    color: Color(0xFF848484),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0, left: 10, right: 10),
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
                      backgroundColor: Color(0xFF000000),
                      radius: 4,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "About Company",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                child: const Text(
                  'Edyone Education Private Limited  is an Indian educational technology company headquartered in Jattari Aligarh Uttar Pradesh. The Company was founded by Amit Dagur in 2024. Edyone Education Private Limited owns a platform calledn “Edyone” that provides online tution classes for the students and learners.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 19.6 / 14,
                    letterSpacing: 0.01,
                    color: Color(0xFF848484),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 213.0,
                        // Height of the carousel
                        autoPlay: false,
                        enlargeCenterPage: false,
                        // No scaling of the central item
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.6,
                        // Adjust this to fit three boxes with correct spacing
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                      ),
                      itemCount: _imageData.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          width: 205.0,
                          height: 213.0,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0), // Space between boxes
                          child: boxTemplate(_imageData, index),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20, // Space between the carousel and the dots
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _imageData.length,
                        (index) => Container(
                          width: 10.43,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: _currentImageIndex == index
                                ? const Color(0xFF4A3AFF)
                                : Colors.grey.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget boxTemplate(List<Map<String, String>> data, int index) {
    return Container(
      width: 202.0,
      height: 213.0, // Height of each box
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15.0, // Increased blur radius
            spreadRadius: 1.0, // Added spread radius
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 138.0,
            height: 138.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4A3AFF),
                width: 4.0,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                data[index]['image']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            data[index]['designation']!,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 9.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4A3AFF),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            data[index]['name']!,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 12.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Text(
            data[index]['caption']!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
