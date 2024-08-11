import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _currentImageIndex = 0;

  final List<Map<String, String>> _imageData = [
    {
      'image': 'assets/images/flaf.png',
      'caption': '',
      'designation': 'Designer',
      'name': 'John Doe'
    },
    {
      'image': 'assets/images/flaf.png',
      'caption': ' ',
      'designation': 'Developer',
      'name': 'Jane Smith'
    },
    {
      'image': 'assets/images/flaf.png',
      'caption': ' ',
      'designation': 'Manager',
      'name': 'Emily Clark'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 213.0, // Height of the carousel
                autoPlay: false,
                enlargeCenterPage: false, // No scaling of the central item
                aspectRatio: 16 / 9,
                viewportFraction:
                    0.6, // Adjust this to fit three boxes with correct spacing
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
                  margin: EdgeInsets.symmetric(
                      horizontal: 0.0), // Space between boxes
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
            blurRadius: 10.0,
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
          const SizedBox(height: 5),
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
          const SizedBox(height: 10),
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
