import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BatchScreen extends StatefulWidget {
  @override
  _BatchScreenState createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen> {
  late Future<List<dynamic>> futureBatches;

  @override
  void initState() {
    super.initState();
    futureBatches = fetchBatches();
  }

  Future<List<dynamic>> fetchBatches() async {
    final response = await http.get(
      Uri.parse('https://admin.edyone.site/api/batch/list'),
      headers: {
        'Authorization': 'Bearer fKlw0WyyLhFDZCCuwfKBBlWaREbcj8yn8xPWrVsS',
      },
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData['data']; // Returns the list of batches
    } else {
      throw Exception('Failed to load batch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: futureBatches,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<dynamic>? batches = snapshot.data;

            return ListView.builder(
              itemCount: batches!.length,
              itemBuilder: (context, index) {
                var batch = batches[index];

                // Extracting first teacher data if available
                var firstTeacher = batch['courses'][0]['teachers'][0];

                // Null checks for images and text
                String batchImage = batch['batch_image'] ?? '';
                String teacherImage = firstTeacher['teacher_image'] ?? '';
                String courseName =
                    batch['courses'][0]['course_name'] ?? 'No Name';
                String batchDescription =
                    batch['batch_description'] ?? 'No description available';
                String batchRating = batch['batch_rating'] ?? '0.0';
                String teacherName = firstTeacher['teacher_name'] ?? 'No Name';
                String teacherRating =
                    firstTeacher['teacher_avg_rating'] ?? '0.0';
                String teacherRatingCount =
                    firstTeacher['teacher_rating_count'].toString();
                String totalCourses = batch['total_courses'].toString();
                String totalPrice = batch['total_price'].toString();

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Batch Image
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: batchImage,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Center(
                                child: Icon(Icons.error, color: Colors.red),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),

                          // Course Name
                          Text(
                            courseName,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),

                          // Batch Description
                          Text(
                            batchDescription,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),

                          // Batch Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Batch Rating',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  ..._buildRatingStars(
                                      double.parse(batchRating)),
                                  SizedBox(width: 5),
                                  Text(
                                    batchRating,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          //clasees start
                          SizedBox(
                              height:
                                  4), // Small gap between the second and third text widgets
                          Container(
                            width: double
                                .infinity, // Fixed width for the layout container
                            height: 30, // Fixed height for the layout container
                            // Padding
                            padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 17, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/courseicon.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Live Classes', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 16, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/courseicon.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Recorded Classes', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 16, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/courseicon.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Mock Tests', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double
                                .infinity, // Fixed width for the layout container
                            height: 30, // Fixed height for the layout container
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFFEDEDED),
                                  width: 0.5,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 17, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/courseicon.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Live Classes', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 16, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/courseicon.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Recorded Classes', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 16, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/courseicon.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Mock Tests', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //end

                          // Subjects Covered
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subjects Covered',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Total Subjects: $totalCourses',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  10), // Small gap between the second and third text widgets
                          Container(
                            width: double
                                .infinity, // Fixed width for the layout container
                            height: 30, // Fixed height for the layout container
                            padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 17, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/subject.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Subject Name', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 16, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/subject.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Subject Name', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 16, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/subject.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Subject Name', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  10), // Small gap between the second and third text widgets
                          Container(
                            width: double
                                .infinity, // Fixed width for the layout container
                            height: 30, // Fixed height for the layout container
                            padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 17, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/subject.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Subject Name', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 16, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/subject.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Subject Name', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 16, // Fixed height for the text
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'icon/subject.png', // Image asset path
                                        width: 16, // Image width
                                        height: 16, // Image height
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Space between image and text
                                      Text(
                                        'Subject Name', // Text content
                                        style: TextStyle(
                                          fontFamily:
                                              'DM Sans', // Use the DM Sans font
                                          fontWeight: FontWeight
                                              .w500, // Font weight 500
                                          fontSize: 12, // Font size 10px
                                          height: 16.8 /
                                              10, // Line height, calculated based on font size
                                          color:
                                              Color(0xFF494949), // Text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          // Instructor Info
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: teacherImage.isNotEmpty
                                    ? NetworkImage(teacherImage)
                                    : AssetImage(
                                            'assets/placeholder_avatar.png')
                                        as ImageProvider,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          teacherName,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        ..._buildRatingStars(
                                            double.parse(teacherRating)),
                                        SizedBox(width: 5),
                                        Text(
                                          '$teacherRating ($teacherRatingCount)',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          // Price and Buy Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.currency_rupee,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(
                                    totalPrice,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_shopping_cart,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      // Handle Add to Cart
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle Buy Now
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: Text('Buy Now'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }

  // Function to build rating stars
  List<Widget> _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      stars.add(
        Icon(
          Icons.star,
          color: i <= rating
              ? Colors.yellow[700] // Yellow for filled stars
              : Colors.red[300], // Red for empty stars
          size: 20,
        ),
      );
    }
    return stars;
  }

  // Function to build feature icons with text
  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.blue,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
