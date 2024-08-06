import 'dart:convert'; // Import dart:convert package
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Navbar.dart';
import 'register_mobile.dart';

class AddressDetailsPage extends StatefulWidget {
  const AddressDetailsPage({Key? key}) : super(key: key);

  @override
  _AddressDetailsPageState createState() => _AddressDetailsPageState();
}

class _AddressDetailsPageState extends State<AddressDetailsPage> {
  final TextEditingController _floorHouseController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();
  String? _selectedState;
  String? _selectedCity;
  List<String> _states = ['Up', 'MP', 'Bihar'];
  List<String> _cities = ['Lucknow', 'Kanpur', 'Delhi'];
  late String _token;
  late int _userId;

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token') ?? '';
      _userId = prefs.getInt('id') ?? 0;
    });
  }

  Future<void> _submitAddressDetails() async {
    // Validate fields
    if (_floorHouseController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _landmarkController.text.isEmpty ||
        _zipcodeController.text.isEmpty ||
        _selectedState == null ||
        _selectedCity == null) {
      _showErrorDialog('Please fill in all fields.');
      return;
    }

    // Prepare data to send to the server
    Map<String, dynamic> addressData = {
      'house_no': _floorHouseController.text,
      'state': _selectedState,
      'address': _addressController.text,
      'zip_code': _zipcodeController.text,
      'city': _selectedCity,
      'landmark': _landmarkController.text,
    };

    try {
      // Perform API call to save address details
      var response = await http.post(
        Uri.parse('https://admin.edyone.site/api/student/detail-step3'),
        headers: {
          'Authorization': 'Bearer $_token', // Add token to headers
          'Content-Type': 'application/json', // Specify content type
        },
        body: jsonEncode(addressData), // Encode data to JSON
      );

      // Check the response status code
      if (response.statusCode == 200) {
        _showSuccessDialog();
      } else {
        // Show error message if the request fails
        _showErrorDialog(
            'Failed to save address details. Please try again later.');
      }
    } catch (e) {
      // Handle any exceptions that might occur
      print('Error: $e');
      _showErrorDialog('An error occurred. Please try again later.');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('You have registered successfully.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Navbar()));
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Handle arrow click
                  },
                  child: const Icon(Icons.arrow_back_ios_sharp), // Arrow icon
                ),
                GestureDetector(
                  onTap: () {
                    _showSuccessDialog(); // Skip and show success dialog
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 20), // Added space between arrow button and text
            const Text(
              'Enter Your Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10), // Added space between text and fields
            TextFormField(
              controller: _floorHouseController,
              decoration: const InputDecoration(labelText: 'Floor/House No.'),
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: _landmarkController,
              decoration: const InputDecoration(labelText: 'Landmark'),
            ),
            TextFormField(
              controller: _zipcodeController,
              decoration: const InputDecoration(labelText: 'Zipcode'),
            ),
            DropdownButtonFormField<String>(
              value: _selectedState,
              onChanged: (value) {
                setState(() {
                  _selectedState = value;
                });
              },
              items: _states.map((state) {
                return DropdownMenuItem(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'State'),
            ),
            DropdownButtonFormField<String>(
              value: _selectedCity,
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                });
              },
              items: _cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'City'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.pink],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(15.0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.black54; // Text color when disabled
                      }
                      return Colors.white; // Text color when enabled
                    }),
                  ),
                  onPressed: _submitAddressDetails,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
