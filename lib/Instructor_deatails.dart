import 'package:flutter/material.dart';
import 'Instructor.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool showTeacherProfile = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
               padding: EdgeInsets.fromLTRB(15, 8, 16, 0),

              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyWidget()), // Replace YourPage with your desired page
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Instructors',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14),
            // Add your content here
            CustomCard(),
            SizedBox(height: 14),
            // Add your images here
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/image1.png', // Replace with your image path
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(height: 8),
                      Text('4', style: TextStyle(fontSize: 16)), // First text below the image
                      Text('Courses', style: TextStyle(fontSize: 16)), // Second text below the image
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/imge2.png', // Replace with your image path
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(height: 8),
                      Text('5+', style: TextStyle(fontSize: 16)), // First text below the image
                      Text('Experience', style: TextStyle(fontSize: 16)), // Second text below the image
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/image3.png', // Replace with your image path
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(height: 8),
                      Text('4.8', style: TextStyle(fontSize: 16)), // First text below the image
                      Text('Ratings', style: TextStyle(fontSize: 16)), // Second text below the image
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'About ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Amit Kumar is a highly experienced instructor with over 5 years of teaching Physics. '
                    'He has a passion for making complex concepts easy to understand and engaging for his students. '
                    'With 4 courses available and a rating of 4.8, Amit has established himself as a top instructor '
                    'in the field. He is dedicated to continuous learning and improving his teaching methods to provide '
                    'the best educational experience for his students.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showTeacherProfile = true;
                      });
                    },
                    child: Column(
                      children: [
                        GradientText(
                          'Assistant Teachers',
                          gradient: showTeacherProfile
                              ? LinearGradient(
                            colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                          )
                              : LinearGradient(colors: [Colors.black, Colors.black]),
                        ),
                        Container(
                          height: 4,
                          width: 180,
                          decoration: BoxDecoration(
                            gradient: showTeacherProfile
                                ? LinearGradient(
                              colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                            )
                                : LinearGradient(colors: [Colors.grey, Colors.grey]),
                          ),
                        ),
                      ],
                    ),
                  ),
               SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showTeacherProfile = false;
                      });
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: GradientText(
                            'Reviews',
                            gradient: !showTeacherProfile
                                ? LinearGradient(
                              colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                            )
                                : LinearGradient(colors: [Colors.black, Colors.black]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14.0),
                          child: Container(
                            height: 4,
                            width: 115,
                            decoration: BoxDecoration(
                              gradient: !showTeacherProfile
                                  ? LinearGradient(
                                colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                              )
                                  : LinearGradient(colors: [Colors.grey, Colors.grey]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            // Conditional rendering of GridView
            if (showTeacherProfile)
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(
                  4, // You can adjust this number as needed
                      (index) => AssistantTeacherCard(),
                ),
              ),
            SizedBox(height: 4),
            // Depending on the value of showTeacherProfile, show either AssistantTeacherCard or ReviewsSection
            showTeacherProfile ? AssistantTeacherCard() : ReviewsSection(),
          ],
        ),
      ),
    );
  }
}
class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFA10048).withOpacity(0.10),
            Color(0xFF2300FF).withOpacity(0.10),
          ],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(BorderSide(
                color: Colors.transparent,
                width: 2.0,
                style: BorderStyle.solid,
              )),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(161, 0, 72, 1.0),
                  Color.fromRGBO(35, 0, 255, 1.0),
                ],
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/Image/profile.png',
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Amit Kumar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon/mybook.png',
                      width: 16,
                      height: 16,

                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Physics',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4F4F4F),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    CustomSocialIcon(
                      iconPath: 'assets/icon/instagram.png',
                    ),
                    SizedBox(width: 8.0),
                    CustomSocialIcon(
                      iconPath: 'assets/icon/twitter.png',
                    ),
                    SizedBox(width: 8.0),
                    CustomSocialIcon(
                      iconPath: 'assets/icon/linkedin.png',
                    ),
                    SizedBox(width: 8.0),
                    CustomSocialIcon(
                      iconPath: 'assets/icon/facebook.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CustomSocialIcon extends StatelessWidget {
  final String iconPath;

  const CustomSocialIcon({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath,
      width: 24,
      height: 24,
      //color: Colors.black, // Set icon color
    );
  }
}


class AssistantTeacherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 187.0,
      width: 190.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFA10048).withOpacity(0.15),
                Color(0xFF2300FF).withOpacity(0.15),
              ],
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: CircleAvatar(
                  radius: 27.0,
                  backgroundImage: AssetImage('assets/Image/profile.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Text(
                  'John Doe',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon/mybook.png', // Path to your custom physics icon
                    height: 16.0,
                    width: 16.0,
                   // color: Color(0xFF4F4F4F), // Color of the icon
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    'Physics',
                    style: TextStyle(fontSize: 12.0, color: Color(0xFF4F4F4F)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Divider(
                  height: 26.0,
                  thickness: 1.0,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Image/image1.png', // Path to your custom courses icon
                    height: 16.0,
                    width: 16.0,
                   // color: Color(0xFF4F4F4F), // Color of the icon
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    '6 Courses',
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
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

class ReviewsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 0),
        // Add your reviews here
        ReviewCard(
          studentName: 'Alice Johnson',
          rating: 5,
          review: 'Amit is a fantastic teacher! His explanations are clear and easy to understand.',
        ),
        ReviewCard(
          studentName: 'Bob Smith',
          rating: 4,
          review: 'I have learned so much in Amit\'s class. Highly recommend!',
        ),
        ReviewCard(
          studentName: 'Charlie Brown',
          rating: 4.5,
          review: 'Great teaching style and very approachable.',
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String studentName;
  final String review;
  final double rating;

  const ReviewCard({
    required this.studentName,
    required this.review,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage( 'assets/Image/profile.png'), // Replace with user profile image path
                  radius: 30,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        studentName,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: List.generate(
                          5,
                              (index) => Icon(
                            Icons.star,
                            color: index < rating ? Colors.orange : Colors.grey,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              review,
              style: TextStyle(fontSize: 16),
            ),
            Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Was this review helpful?',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 4),
                    Image.asset(
                      'assets/icon/unlike.png', // Replace with your own thumb up icon image path
                      width: 24,
                      height: 24,
                      color: Colors.red, // Set icon color
                    ),
                    SizedBox(width: 8),
                    Image.asset(
                      'assets/icon/like.png', // Replace with your own thumb down icon image path
                      width: 24,
                      height: 24,
                      color: Colors.green, // Set icon color
                    ),
                    SizedBox(width: 4),
                    Text(
                      '3',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}


class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;

  const GradientText(
      this.text, {
        required this.gradient,
      });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white, // This color is only a placeholder
        ),
      ),
    );
  }
}
