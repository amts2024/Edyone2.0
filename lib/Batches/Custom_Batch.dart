import 'dart:convert'; // For JSON decoding
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../Api/Batch.dart'; // Ensure this path is correct
import 'package:edyon/Batches/Batch_Modal.dart'; // Ensure this path is correct

class BatchScreens extends StatefulWidget {
  @override
  _BatchScreensState createState() => _BatchScreensState();
}

class _BatchScreensState extends State<BatchScreens> {
  late Future<List<dynamic>> futureBatches;
  final ApiService apiService = ApiService();
  Map<String, dynamic>? _responseData; // Variable to store response data

  @override
  void initState() {
    super.initState();
    futureBatches = apiService.fetchBatches();
  }

  void _handleAddToBatch(int courseId) async {
    try {
      final response = await apiService.addToBatch(courseId);
      final decodedResponse = jsonDecode(response);
      setState(() {
        _responseData = decodedResponse;
        futureBatches = apiService.fetchBatches(); // Refresh the list
      });
    } catch (e) {
      setState(() {
        _responseData = {
          "message": "Failed to add batch: $e"
        }; // Update response data on error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Batch'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: futureBatches,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  List<dynamic>? batches = snapshot.data;

                  return ListView.builder(
                    itemCount: batches!.length + 1,
                    itemBuilder: (context, index) {
                      if (index == batches.length) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mathematics',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Complete NCERT Hindi Classes 5',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.delete,
                                              color: Colors.red),
                                          onPressed: () {
                                            // Handle delete action
                                          },
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '500',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        var batch = batches[index];
                        var firstTeacher = batch['courses'][0]['teachers'][0];
                        String batchImage = batch['batch_image'] ?? '';
                        String teacherImage =
                            firstTeacher['teacher_image'] ?? '';
                        String courseName =
                            batch['courses'][0]['course_name'] ?? 'No Name';
                        String batchDescription = batch['batch_description'] ??
                            'No description available';
                        String batchRating = batch['batch_rating'] ?? '0.0';
                        String teacherName =
                            firstTeacher['teacher_name'] ?? 'No Name';
                        String teacherRating =
                            firstTeacher['teacher_avg_rating'] ?? '0.0';
                        String teacherRatingCount =
                            firstTeacher['teacher_rating_count'].toString();
                        String totalCourses = batch['total_courses'].toString();
                        String totalPrice = batch['total_price'].toString();
                        int courseId = batch['courses'][0]
                            ['course_id']; // Pass course_id for the API call

                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.white, width: 2.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: batchImage,
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Center(
                                            child: Icon(Icons.error,
                                                color: Colors.red),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        courseName,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                      SizedBox(height: 10),
                                      Container(
                                        width: double.infinity,
                                        height: 30,
                                        padding:
                                            EdgeInsets.fromLTRB(12, 0, 16, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            _buildSubjectRow('Subject Name'),
                                            _buildSubjectRow('Subject Name'),
                                            _buildSubjectRow('Subject Name'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundImage: teacherImage
                                                    .isNotEmpty
                                                ? NetworkImage(teacherImage)
                                                : AssetImage(
                                                        'assets/placeholder_avatar.png')
                                                    as ImageProvider,
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      teacherName,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    ..._buildRatingStars(
                                                        double.parse(
                                                            teacherRating)),
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
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: Color(0xFFF5F5F5),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 16.0),
                                child: GestureDetector(
                                  onTap: () => _handleAddToBatch(courseId),
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFA10048),
                                          Color(0xFF2300FF),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Add To Batch',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      }
                    },
                  );
                } else {
                  return Center(child: Text('No data found'));
                }
              },
            ),
          ),
          if (_responseData != null) // Display response data
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Message: ${_responseData?['message'] ?? 'No message'}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Batch Name: ${_responseData?['data']?['batch']?['name'] ?? 'No name'}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      'Batch ID: ${_responseData?['data']?['batch']?['batch_id'] ?? 'No ID'}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      'Start Date: ${_responseData?['data']?['batch']?['start_date'] ?? 'No start date'}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      'End Date: ${_responseData?['data']?['batch']?['end_date'] ?? 'No end date'}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      'Description: ${_responseData?['data']?['batch']?['description'] ?? 'No description'}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Total Courses: ${_responseData?['data']?['total_courses'] ?? 'No total courses'}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      'Total Price: ${_responseData?['data']?['total_price'] ?? 'No total price'}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    // Add more fields as needed
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      stars.add(
        Icon(
          Icons.star,
          color: i <= rating ? Colors.yellow[700] : Colors.red[300],
          size: 20,
        ),
      );
    }
    return stars;
  }

  Widget _buildSubjectRow(String subjectName) {
    return Container(
      height: 16,
      child: Row(
        children: [
          Image.asset(
            'icon/subject.png',
            width: 16,
            height: 16,
          ),
          SizedBox(width: 4),
          Text(
            subjectName,
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              height: 16.8 / 10,
              color: Color(0xFF494949),
            ),
          ),
        ],
      ),
    );
  }
}

extension ApiServiceExtension on ApiService {
  Future<dynamic> addToBatch(int courseId) async {
    // Implement your API call here and return the response as a decoded JSON object
    // Here is a placeholder response for demonstration
    final jsonResponse = jsonEncode({
      "message": "BatchCourse added to existing batch.",
      "data": {
        "batch": {
          "batch_id": 3,
          "name": "This Batch For 5th Abhimanyu Kumar Singh",
          "start_date": "August 30, 2024",
          "end_date": "March 31, 2025",
          "is_admin": 0,
          "description":
              "This batch for the course  by Abhimanyu Kumar Singh starts on August 30, 2024 and ends on March 31, 2025.",
          "courses": [
            {
              "course_id": 2,
              "title": "software",
              "class": "5th",
              "language": "hindi",
              "price": "0",
              "selected": true
            },
            {
              "course_id": 3,
              "title": "SOFTWARE",
              "class": "5th",
              "language": "english",
              "price": "0",
              "selected": true
            }
          ]
        },
        "total_courses": 2,
        "total_price": 0
      },
      "status": true
    });

    // Decode the JSON string to a Dart object
    return jsonDecode(jsonResponse);
  }
}
