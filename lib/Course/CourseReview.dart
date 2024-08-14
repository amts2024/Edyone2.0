import 'package:flutter/material.dart';

class CourseReview extends StatelessWidget {
  const CourseReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20), // Margin of 20px from left and right
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20), // Top padding

          // "Featured Review" text
          Text(
            'Featured Review',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              height: 21.6 / 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12), // Gap between elements

          // "Student Name" text
          Text(
            'Student Name',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 24 / 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 8), // Gap between elements

          // Row for stars and review time
          Row(
            children: [
              // Full stars
              for (var i = 0; i < 5; i++)
                Icon(
                  Icons.star, // Star icon
                  color: Color(0xFFFFA927), // Star icon color
                  size: 16, // Star icon size
                ),
              SizedBox(width: 5), // Space between stars and rating text

              // "1 week ago" text
              Text(
                '1 week ago',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 16.8 / 12, // Line height
                  color: Color(0xFF494949), // Text color
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Gap between elements

          // Review content text
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean consequat feugiat eget ut nibh. Mi bibendum at dui, laoreet. Iaculis sit at nulla amet ultrices proin neque arcu. Lacus tincidunt viverra ipsum sapien accumsan. Amet, mattis nisl netus in maecenas est mollis nunc tortor. Dis consequat pellentesque leo ut at. Et pellentesque et sem eget'
                'Eget feugiat risus nisi egestas luctus est sed elementum.', // Replace with actual content
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 16.8 / 14, // Line height
              color: Color(0xFF70747E), // Text color
            ),
          ),

          SizedBox(height: 8), // Gap before "Did you find it helpful?" section

          // "Did you find it helpful?" section with "Report" and images
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns content to the space between
            crossAxisAlignment: CrossAxisAlignment.center, // Aligns vertically to the center
            children: [
              // Left side text: "Did you find it helpful?"
              Text(
                "Did you find it helpful?",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 14.4 / 12, // Line height
                  color: Colors.black, // Adjust color if needed
                ),
                textAlign: TextAlign.left,
              ),

              // Right side: Images and "Report" text
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // First small image
                  Image.asset(
                    'icon/Grouplike.png', // Replace with your small image path
                    width: 24.14,
                    height: 24.14,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 4), // Gap between images

                  // Second small image
                  Image.asset(
                    'icon/Groupdislike.png', // Replace with your small image path
                    width: 24.14,
                    height: 24.14,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8), // Gap between second image and "Report" text

                  // "Report" text
                  Text(
                    "Report",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 14.4 / 12, // Line height
                      color: Colors.black, // Adjust color if needed
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),


          SizedBox(height: 10),

          // View Profile button
          Container(
            width: 388,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Center(
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height)),
                child: Text(
                  'View More Reviews',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    letterSpacing: 0.01,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
