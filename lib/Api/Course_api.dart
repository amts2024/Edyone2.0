import 'dart:convert';
import 'package:http/http.dart' as http;
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
