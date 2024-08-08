import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  String? _termsContent;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTermsAndConditions();
  }

  Future<void> fetchTermsAndConditions() async {
    final url = Uri.parse('https://admin.edyone.site/api/terms/get');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer hCSJk41yEtchDa4JH8HLtLVj5hOxDXpq1ycIuggn'
      },
      body: json.encode({'type': 'terms_and_conditions'}),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['status'] == true) {
        setState(() {
          _termsContent = responseBody['data'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _termsContent = "Failed to load terms and conditions.";
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _termsContent = "Failed to load terms and conditions.";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
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
                    'Terms and Conditions',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0B121F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Html(
                        data: _termsContent,
                        style: {
                          "body": Style(
                            fontFamily: 'Poppins',
                            fontSize: FontSize(14),
                            color: Color(0xFF000000),
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
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                          "p": Style(
                            fontSize: FontSize(14),
                            fontFamily: 'Poppins',
                          ),
                          "ul": Style(
                            fontSize: FontSize(14),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                          "ol": Style(
                            fontSize: FontSize(14),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                          "li": Style(
                            fontSize: FontSize(14),
                            fontFamily: 'Poppins',
                          ),
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
