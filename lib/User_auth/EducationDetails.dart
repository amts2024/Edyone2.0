import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'register_adress.dart'; // Ensure this is the correct import for the address page

class EducationDetails extends StatelessWidget {
  const EducationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your Academic details',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 20.0),
            const EducationFormField(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomButton(),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          _submitEducationDetails(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Remove default background
          shadowColor: Colors.transparent, // Remove default shadow
        ),
        child: Container(
          height: 56.0,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.pink, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Center(
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submitEducationDetails(BuildContext context) async {
    const String apiUrl =
        'https://admin.edyone.site/api/student/detail-step2'; // Replace with your actual API endpoint

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Token not found. Please log in again.'),
        ),
      );
      return;
    }

    final Map<String, String?> data = {
      'state': _EducationFormFieldState.selectedOption1,
      'board': _EducationFormFieldState.selectedOption2,
      'class': _EducationFormFieldState.selectedOption3,
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        _navigateToAddressDetailsPage(context);
      } else {
        _showErrorDialog(context, 'Failed to submit education details.');
      }
    } catch (error) {
      print('Error: $error');
      _showErrorDialog(context, 'An error occurred. Please try again later.');
    }
  }

  void _navigateToAddressDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddressDetailsPage()),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class EducationFormField extends StatefulWidget {
  const EducationFormField({Key? key}) : super(key: key);

  @override
  _EducationFormFieldState createState() => _EducationFormFieldState();
}

class _EducationFormFieldState extends State<EducationFormField> {
  static String? selectedOption1;
  static String? selectedOption2;
  static String? selectedOption3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'State',
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          value: selectedOption1,
          onChanged: (newValue) {
            setState(() {
              selectedOption1 = newValue;
            });
          },
          items: _getStatesList().map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 20.0),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Education Board',
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          value: selectedOption2,
          onChanged: (newValue) {
            setState(() {
              selectedOption2 = newValue;
            });
          },
          items: const ['CBSE'].map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 20.0),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Standard / Class',
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          value: selectedOption3,
          onChanged: (newValue) {
            setState(() {
              selectedOption3 = newValue;
            });
          },
          items: const [
            '4th',
            '5th',
            '6th',
            '7th',
            '8th',
            '9th',
            '10th',
            '11th',
            '12th'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  List<String> _getStatesList() {
    return const [
      'Andhra Pradesh',
      'Arunachal Pradesh',
      'Assam',
      'Bihar',
      'Chhattisgarh',
      'Goa',
      'Gujarat',
      'Haryana',
      'Himachal Pradesh',
      'Jharkhand',
      'Karnataka',
      'Kerala',
      'Madhya Pradesh',
      'Maharashtra',
      'Manipur',
      'Meghalaya',
      'Mizoram',
      'Nagaland',
      'Odisha',
      'Punjab',
      'Rajasthan',
      'Sikkim',
      'Tamil Nadu',
      'Telangana',
      'Tripura',
      'Uttar Pradesh',
      'Uttarakhand',
      'West Bengal',
    ];
  }
}

// // Define your dashboard pages according to class
// class DashboardPageClass4 extends StatelessWidget {
//   const DashboardPageClass4({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard for Class 4')),
//       body: const Center(child: Text('Dashboard for Class 4')),
//     );
//   }
// }
//
// class DashboardPageClass5 extends StatelessWidget {
//   const DashboardPageClass5({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard for Class 5')),
//       body: const Center(child: Text('Dashboard for Class 5')),
//     );
//   }
// }
//
// // Define similar classes for other classes up to Class 12
//
// class DashboardPageClass6 extends StatelessWidget {
//   const DashboardPageClass6({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard for Class 6')),
//       body: const Center(child: Text('Dashboard for Class 6')),
//     );
//   }
// }
//
// class DashboardPageClass7 extends StatelessWidget {
//   const DashboardPageClass7({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard for Class 7')),
//       body: const Center(child: Text('Dashboard for Class 7')),
//     );
//   }
// }
//
// class DashboardPageClass8 extends StatelessWidget {
//   const DashboardPageClass8({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard for Class 8')),
//       body: const Center(child: Text('Dashboard for Class 8')),
//     );
//   }
// }
//
// class DashboardPageClass9 extends StatelessWidget {
//   const DashboardPageClass9({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard for Class 9')),
//       body: const Center(child: Text('Dashboard for Class 9')),
//     );
//   }
// }
//
// class DashboardPageClass10 extends StatelessWidget {
//   const DashboardPageClass10({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard for Class 10')),
//       body: const Center(child: Text('Dashboard for Class 10')),
//     );
//   }
// }
//
// class DashboardPageClass11 extends StatelessWidget {
//   const DashboardPageClass11({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard for Class 11')),
//       body: const Center(child: Text('Dashboard for Class 11')),
//     );
//   }
// }
//
// class DashboardPageClass12 extends StatelessWidget {
//   const DashboardPageClass12({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard for Class 12')),
//       body: const Center(child: Text('Dashboard for Class 12')),
//     );
//   }
// }
//
// class DefaultDashboardPage extends StatelessWidget {
//   const DefaultDashboardPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard')),
//       body: const Center(child: Text('Default Dashboard')),
//     );
//   }
// }
