import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
 // final String _baseUrl = 'http://52.66.248.226/api/student/otp-send';

  Future<dynamic> sendOtp(String phoneNumber) async {
    final url = Uri.parse('http://52.66.248.226/api/student/otp-send');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone_number': phoneNumber,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print('Response body: $responseBody'); // Debugging line

      if (responseBody['success']) {
        // Store the token
        String token = responseBody['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);
        return true;
      } else {
        print('Error: ${responseBody['message']}'); // Debugging line
        return false;
      }
    } else {
      print('HTTP error: ${response.statusCode}'); // Debugging line
      return false;
    }
  }
}
