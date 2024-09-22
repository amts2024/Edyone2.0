import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  final int teacherId;

  Details({required this.teacherId});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Future<Map<String, dynamic>?> _teacherDetail;
  late Future<List<Map<String, dynamic>>> _reviews;
  bool showTeacherProfile = true;

  @override
  void initState() {
    super.initState();
    _teacherDetail = fetchTeacherDetails(widget.teacherId);
    _reviews = fetchReviews(widget.teacherId);
  }

  Future<Map<String, dynamic>?> fetchTeacherDetails(int teacherId) async {
    final response = await http.post(
      Uri.parse('https://admin.edyone.site/api/teacher/get-by-id'),
      headers: {
        'Authorization': 'Bearer hCSJk41yEtchDa4JH8HLtLVj5hOxDXpq1ycIuggn',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'teacher_id': teacherId}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data is Map<String, dynamic>) {
        return data['teacher'] ?? data['data'];
      }
    } else {
      throw Exception('Failed to load teacher details');
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> fetchReviews(int teacherId) async {
    try {
      final response = await http.post(
        Uri.parse('https://admin.edyone.site/api/teacher/review-list'),
        headers: {
          'Authorization': 'Bearer hCSJk41yEtchDa4JH8HLtLVj5hOxDXpq1ycIuggn',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'teacher_id': teacherId}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic> &&
            data.containsKey('data') &&
            data['data'] is List) {
          return List<Map<String, dynamic>>.from(data['data']);
        } else {
          return [];
        }
      } else {
        print('Failed to fetch reviews: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error occurred: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _teacherDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final teacher = snapshot.data;
            if (teacher != null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CustomCard(teacher: teacher),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildProfileStat(
                            context,
                            'assets/images/image1.png',
                            '4',
                            'Courses',
                            'Courses tapped',
                          ),
                          _buildProfileStat(
                            context,
                            'assets/images/imge2.png',
                            '${teacher['experience'] ?? 'N/A'}',
                            'Experience',
                            'Experience tapped',
                          ),
                          _buildProfileStat(
                            context,
                            'assets/images/image3.png',
                            '${teacher['rating'] ?? '0.0'}',
                            'Ratings',
                            'Ratings tapped',
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
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon(
                            'assets/icon/instagram.png',
                            'Instagram icon tapped',
                          ),
                          SizedBox(width: 16.0),
                          _buildSocialIcon(
                            'assets/icon/linkedin.png',
                            'LinkedIn icon tapped',
                          ),
                          SizedBox(width: 16.0),
                          _buildSocialIcon(
                            'assets/icon/facebook.png',
                            'Facebook icon tapped',
                          ),
                          SizedBox(width: 16.0),
                          _buildSocialIcon(
                            'assets/icon/twitter.png',
                            'Twitter icon tapped',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        teacher['about']?.replaceAll(RegExp(r'<[^>]*>'), '') ??
                            'No information available',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildTabButton(
                            'Teacher Profile',
                            showTeacherProfile,
                            () {
                              setState(() {
                                showTeacherProfile = true;
                              });
                            },
                          ),
                          _buildTabButton(
                            'Reviews',
                            !showTeacherProfile,
                            () {
                              setState(() {
                                showTeacherProfile = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    if (showTeacherProfile)
                      ProfileView(
                        profileImage: 'assets/images/profile.png',
                        teacherImage: 'assets/images/teacher.png',
                        teacherName: teacher['name'] ?? 'Unknown Teacher',
                        subjectIcon: 'assets/images/subject.png',
                        subjectName: teacher['subject'] ?? 'Subject',
                        courseImage: 'assets/images/courses.png',
                        courses: '4',
                      )
                    else
                      ReviewsSection(reviewsFuture: _reviews),
                  ],
                ),
              );
            }
          }
          return Center(child: Text('No teacher data available.'));
        },
      ),
    );
  }

  Widget _buildProfileStat(BuildContext context, String iconPath, String value,
      String label, String snackBarMessage) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(snackBarMessage)),
        );
      },
      child: Column(
        children: [
          Image.asset(
            iconPath,
            width: 40,
            height: 40,
          ),
          SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 16)),
          Text(label, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String iconPath, String message) {
    return GestureDetector(
      onTap: () {
        print(message);
      },
      child: SizedBox(
        width: 40,
        height: 40,
        child: Image.asset(
          iconPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 189,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: isSelected ? Colors.transparent : Colors.grey,
                  width: isSelected ? 3 : 1,
                ),
              ),
            ),
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: isSelected
                    ? [Color(0xFFA10048), Color(0xFF2300FF)]
                    : [Colors.black, Colors.black],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ).createShader(bounds),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          if (isSelected)
            Container(
              height: 3,
              width: 189,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Map<String, dynamic> teacher;

  CustomCard({required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(8.0), // Adjust padding as needed
        child: Row(
          children: [
            // Container to enforce specific dimensions
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    teacher['Image'] ??
                        'https://example.com/default_profile_picture.jpg',
                  ),
                  fit: BoxFit
                      .cover, // Ensures the image covers the entire circle
                ),
              ),
            ),
            SizedBox(width: 16), // Space between Container and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teacher['name'] ?? 'Unknown Teacher',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Qualification: ${teacher['subject'] ?? 'N/A'}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  final String profileImage;
  final String teacherImage;
  final String teacherName;
  final String subjectIcon;
  final String subjectName;
  final String courseImage;
  final String courses;

  const ProfileView({
    required this.profileImage,
    required this.teacherImage,
    required this.teacherName,
    required this.subjectIcon,
    required this.subjectName,
    required this.courseImage,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
// Handle profile click
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              child: CircleAvatar(
                backgroundImage: AssetImage(profileImage),
                radius: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 8),
                  Expanded(
                    child: Center(
                      child: Text(
                        teacherName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    subjectIcon,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    subjectName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    courseImage,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      courses,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewsSection extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> reviewsFuture;

  ReviewsSection({required this.reviewsFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: reviewsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final reviews = snapshot.data!;
          if (reviews.isEmpty) {
            return Center(child: Text('No reviews available.'));
          } else {
            return Column(
              children: reviews.map((review) {
                return ReviewCard(
                  teacherRatingId: review['teacher_rating_id'] ?? 0,
                  name: review['user'] ?? 'Anonymous',
                  date: review['date'] ?? '',
                  rating: (review['rating'] ?? 0).toDouble(),
                  review: review['comments'] ?? 'No review text',
                  profileImageUrl: review['profile_image'] ??
                      'https://example.com/default_profile_picture.jpg',
                  likes: review['likes'] ?? 0,
                  dislikes: review['deslikes'] ?? 0,
                );
              }).toList(),
            );
          }
        } else {
          return Center(child: Text('No reviews found.'));
        }
      },
    );
  }
}

class ReviewCard extends StatefulWidget {
  final int teacherRatingId;
  final String name;
  final String date;
  final double rating;
  final String review;
  final String profileImageUrl;
  final int likes;
  final int dislikes;

  ReviewCard({
    required this.teacherRatingId,
    required this.name,
    required this.date,
    required this.rating,
    required this.review,
    required this.profileImageUrl,
    required this.likes,
    required this.dislikes,
  });

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool isLiked = false;
  bool isDisliked = false;
  int likesCount = 0;
  int dislikesCount = 0;

  @override
  void initState() {
    super.initState();
    likesCount = widget.likes;
    dislikesCount = widget.dislikes;
  }

  Future<void> submitLikeDislike(int isLike) async {
    final url = Uri.parse('https://admin.edyone.site/api/teacher/like-deslike');
    final headers = {
      'Authorization': 'Bearer hCSJk41yEtchDa4JH8HLtLVj5hOxDXpq1ycIuggn',
      'Content-Type': 'multipart/form-data',
    };

    final request = http.MultipartRequest('POST', url)
      ..headers.addAll(headers)
      ..fields['teacher_rating_id'] = widget.teacherRatingId.toString()
      ..fields['is_like'] = isLike.toString();

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final decodedData = json.decode(responseData);

      if (decodedData['status'] == true) {
        // Update the UI based on the response
        setState(() {
          if (isLike == 1) {
            isLiked = true;
            isDisliked = false;
            likesCount += 1;
            if (dislikesCount > 0) dislikesCount -= 1;
          } else {
            isDisliked = true;
            isLiked = false;
            dislikesCount += 1;
            if (likesCount > 0) likesCount -= 1;
          }
        });
      }
    } else {
      print('Failed to submit like/dislike');
    }
  }

  @override
  Widget build(BuildContext context) {
    int fullStars = widget.rating.floor();
    bool hasHalfStar = widget.rating - fullStars >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                  radius: 24.0,
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              fullStars,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                            ),
                          ),
                          if (hasHalfStar)
                            Icon(
                              Icons.star_half,
                              color: Colors.amber,
                              size: 16,
                            ),
                          if (emptyStars > 0)
                            Row(
                              children: List.generate(
                                emptyStars,
                                (index) => Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                              ),
                            ),
                          SizedBox(width: 4),
                          Text(
                            widget.rating.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            widget.date,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.review,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Divider(color: Colors.grey[400]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Was this review helpful?',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.thumb_down,
                              color: isDisliked ? Colors.red : Colors.grey,
                              size: 16,
                            ),
                            onPressed: () {
                              if (!isDisliked) {
                                submitLikeDislike(0);
                              }
                            },
                          ),
                          Text(
                            dislikesCount.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 8),
                          IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                              color: isLiked ? Colors.green : Colors.grey,
                              size: 16,
                            ),
                            onPressed: () {
                              if (!isLiked) {
                                submitLikeDislike(1);
                              }
                            },
                          ),
                          Text(
                            likesCount.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey[400]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
