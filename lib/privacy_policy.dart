import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyState();
}

class _PrivacyState extends State<PrivacyPolicy> {
  String? _privacy;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPrivacyPolicy();
  }

  Future<void> fetchPrivacyPolicy() async {
    final url = Uri.parse('https://admin.edyone.site/api/terms/get');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer fKlw0WyyLhFDZCCuwfKBBlWaREbcj8yn8xPWrVsS'
      },
      body: json.encode({'type': 'privacy_policy'}),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['status'] == true) {
        setState(() {
          _privacy = responseBody['data'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _privacy = "Failed to load privacy policy.";
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _privacy = "Failed to load privacy policy.";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
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
                              'Privacy Policy',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xFF0B121F),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Html(
                            data: _privacy,
                            style: {
                              "body": Style(
                                fontFamily: 'Poppins',
                                fontSize: FontSize(10),
                                color: Color(0xFF000000),
                                lineHeight: LineHeight(1.5),
                              ),
                              "h1": Style(
                                fontSize: FontSize(0),
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                              ),
                              "h2": Style(
                                fontSize: FontSize(18),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                              "h3": Style(
                                fontSize: FontSize(16),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                              "p": Style(
                                fontSize: FontSize(14),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              "ul": Style(
                                fontSize: FontSize(14),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                              "ol": Style(
                                fontSize: FontSize(14),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                              "li": Style(
                                fontSize: FontSize(14),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              "a": Style(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                textDecoration: TextDecoration.none,
                              ),
                            },
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
