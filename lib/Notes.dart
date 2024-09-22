import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<Notes> {
  String? _selectedClass;
  String? _selectedSubject;
  PageController _pageController = PageController();
  int _currentPage = 0; // Declare _currentPage

  final List<String> _classes = ['Class 1', 'Class 2', 'Class 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                    'Videos',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Class Dropdown Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(13, 8, 13, 8),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint:
                                  const Text('Select subject or course to see'),
                              value: _selectedClass,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedClass = newValue;
                                });
                              },
                              items: _classes.map((classItem) {
                                return DropdownMenuItem(
                                  value: classItem,
                                  child: Text(classItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: const Text(
                  'Recently Added',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.01,
                    color: Colors
                        .white, // Text color set to white (it won't show due to ShaderMask)
                    height: 1.1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 388,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 104,
                        height: 102,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                          ),
                          image: DecorationImage(
                            image: AssetImage('icon/unsplash__zsL306fDck.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              'Chapter1: Additions- Topic 3: How to take carry to add five numbers.',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 14.4 / 12,
                                color: Color(0xFF0B121F),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Container(
                                  width: 12, // Adjust width as needed
                                  height: 12, // Adjust height as needed

                                  child: ClipOval(
                                    child: Image.asset(
                                      'icon/watch.png', // Path to your image
                                      color: Colors
                                          .transparent, // Ensure image has no fill color
                                      fit: BoxFit.cover, // Adjust fit as needed
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '45:39 min',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    height: 12 / 10,
                                    color: Color(0xFFF7931E),
                                  ),
                                ),
                                const Spacer(), // Adds spacing between the elements in Row
                                Text(
                                  '3 days ago',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    height: 15 / 10,
                                    letterSpacing: 0.01,
                                    color: Color(0xFFF7931E),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: const DecorationImage(
                                          image: AssetImage('icon/Avatars.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Instructor Name',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        height: 16 / 10,
                                        color: Color(0xFF170F49),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Add your onTap functionality here
                                      },
                                      child: Container(
                                        width: 90, // Width of the button
                                        height: 30, // Height of the button
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                5), // Border radius for the top-left corner
                                            // other corners have radius 0px by default
                                          ),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFA10048),
                                              Color(0xFF2300FF)
                                            ], // Gradient colors
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Watch', // Button text
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white, // Text color
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6, // Number of dots
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == _currentPage
                          ? const Color(0xFFA10048) // Active dot color
                          : const Color(0xFFD9D9D9), // Inactive dot color
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                width: 388,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Main content of the Container
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 104,
                            height: 102,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage('icon/unsplash__zsL306fDck.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Ensure text is aligned to the start
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  'Chapter1: Additions- Topic 3: How to take carry to add five numbers.',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 14.4 / 12,
                                    color: Color(0xFF0B121F),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      child: ClipOval(
                                        child: Image.asset(
                                          'icon/watch.png',
                                          color: Colors.transparent,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '45:39 min',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        height: 12 / 10,
                                        color: Color(0xFFF7931E),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '3 days ago',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        height: 15 / 10,
                                        letterSpacing: 0.01,
                                        color: Color(0xFFF7931E),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'icon/Avatars.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          'Instructor Name',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            height: 16 / 10,
                                            color: Color(0xFF170F49),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, // Margin from left and right
                      ),
                      child: Stack(
                        clipBehavior: Clip.none, // Ensure nothing gets clipped
                        children: [
                          // Background container with border radius and background color
                          Container(
                            width: double
                                .infinity, // Make the container take full width
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFC6C6C6),
                            ),
                          ),
                          // Foreground container for the gradient progress
                          Positioned(
                            left: 0,
                            child: Container(
                              width: 388 * 0.5, // 50% width for the gradient
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFA10048),
                                    Color(0xFF2300FF),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ),
                          // Text for "Completed" on the left side
                          // Text for "Completed 50%" on the left side
                          Positioned(
                            left: 0,
                            top:
                                7, // Adjust top to ensure visibility above the container
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Completed ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      height: 12 / 8,
                                      letterSpacing: 0.005,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' 50%',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 8,
                                      fontWeight:
                                          FontWeight.w700, // Make it bold
                                      height: 12 / 8,
                                      letterSpacing: 0.005,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

// Text for "Remaining 50%" on the right side
                          Positioned(
                            right: 0,
                            top:
                                7, // Adjust top to ensure visibility above the container
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Remaining ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      height: 12 / 8,
                                      letterSpacing: 0.005,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' 50%',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 8,
                                      fontWeight:
                                          FontWeight.w700, // Make it bold
                                      height: 12 / 8,
                                      letterSpacing: 0.005,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(bounds),
                      child: const Text(
                        'click to continue',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.01,
                          color: Colors
                              .white, // Text color set to white (it won't show due to ShaderMask)
                          height: 1.1,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6, // Number of dots
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == _currentPage
                          ? const Color(0xFFA10048) // Active dot color
                          : const Color(0xFFD9D9D9), // Inactive dot color
                    ),
                  ),
                ),
              ),

              // Chapter 1
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: 388, // Full width
                  padding: EdgeInsets.symmetric(vertical: 20.0), // Padding
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0, color: Colors.grey)), // Bottom border
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between elements
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 18, // Image width
                            height: 18, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16), // Gap between image and text
                          Text(
                            'Chapter 1', // Replace with actual chapter content
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              height: 28 / 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Total Topics: 15', // Replace with actual topics count
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Chapter 2
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: 388, // Full width
                  padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0, color: Colors.grey)), // Bottom border
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between elements
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 18, // Image width
                            height: 18, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16), // Gap between image and text
                          Text(
                            'Chapter 2', // Replace with actual chapter content
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              height: 28 / 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Total Topics: 15', // Replace with actual topics count
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Chapter 3
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: 388, // Full width
                  padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0, color: Colors.grey)), // Bottom border
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between elements
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 18, // Image width
                            height: 18, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16), // Gap between image and text
                          Text(
                            'Chapter 3', // Replace with actual chapter content
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              height: 28 / 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Total Topics: 15', // Replace with actual topics count
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Chapter 4
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: 388, // Full width
                  padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0, color: Colors.grey)), // Bottom border
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between elements
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 18, // Image width
                            height: 18, // Image height
                            child: Image.asset(
                              'icon/icons8_down.png', // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16), // Gap between image and text
                          Text(
                            'Chapter 4', // Replace with actual chapter content
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              height: 28 / 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Total Topics: 15', // Replace with actual topics count
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
