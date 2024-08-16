import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Modal/My_profile_model.dart';
import '../Modal/Course_model.dart';

class ApiService {
  final String _baseUrl = 'https://admin.edyone.site/api/course/get-list';
  final String _authToken = 'lPpIG4JNsrzakZtGlcxgjiglFVfeWMg8LIX2ydPO';

  Future<List<Course>> fetchCourses({required String courseClass}) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?class=$courseClass&per_page=10'),
      headers: {
        'Authorization': 'Bearer $_authToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data.map((item) => Course.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }
}

Future<Map<String, dynamic>> fetchCourseDetails(String courseId) async {
  final url = Uri.parse('https://admin.edyone.site/api/course/get-by-id');
  final requestBody = jsonEncode({'course_id': courseId});

  // // Retrieve the token from shared preferences
  // final prefs = await SharedPreferences.getInstance();
  // final token =
  //     prefs.getString('token'); // Replace 'authToken' with your actual key
  //
  // if (token == null) {
  //   throw Exception('No authorization token found');
  // }

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer lPpIG4JNsrzakZtGlcxgjiglFVfeWMg8LIX2ydPO',
      'Content-Type': 'application/json',
    },
    body: requestBody,
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['status']) {
      return data['data'];
    } else {
      throw Exception('Failed to load course');
    }
  } else {
    throw Exception('Failed to load course');
  }
}
