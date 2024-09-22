// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String batchListUrl = 'https://admin.edyone.site/api/batch/list';
  final String authToken = 'Bearer fKlw0WyyLhFDZCCuwfKBBlWaREbcj8yn8xPWrVsS';

  Future<List<dynamic>> fetchBatches() async {
    final response = await http.get(
      Uri.parse(batchListUrl),
      headers: {
        'Authorization': authToken,
      },
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData['data'];
    } else {
      throw Exception('Failed to load batch data');
    }
  }
}

class ApiServices {
  final String baseUrl = 'https://admin.edyone.site/api/batch/add';
  final String token = 'fKlw0WyyLhFDZCCuwfKBBlWaREbcj8yn8xPWrVsS';

  Future<Map<String, dynamic>> addToBatch(int courseId) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'course_id': courseId,
          // Assuming batch_id is not required in the request body
        }),
      );

      if (response.statusCode == 200) {
        // Successfully added to batch
        var responseData = jsonDecode(response.body);
        // Extract batch_id from the response
        int batchId = responseData['batch']['batch_id'];
        return {
          'success': true,
          'batchId': batchId,
          'message': 'Batch added successfully',
        };
      } else {
        // Handle errors
        return {
          'success': false,
          'message':
              'Failed to add to batch. Status code: ${response.statusCode}',
          'response': response.body,
        };
      }
    } catch (e) {
      // Catch and log exceptions
      return {
        'success': false,
        'message': 'Exception occurred: $e',
      };
    }
  }
}
