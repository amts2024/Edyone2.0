import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchUserData() async {
  final url = Uri.parse('https://admin.edyone.site/api/student/get-data');
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer lPpIG4JNsrzakZtGlcxgjiglFVfeWMg8LIX2ydPO',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['status']) {
      return data['data'];
    } else {
      throw Exception('Failed to load user data');
    }
  } else {
    throw Exception('Failed to load user data');
  }
}
