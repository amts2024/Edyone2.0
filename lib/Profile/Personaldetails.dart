import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  Future<Map<String, dynamic>>? _userData;

  @override
  void initState() {
    super.initState();
    _userData = fetchUserData(); // Fetch data when widget is initialized
  }

  Future<Map<String, dynamic>> fetchUserData() async {
    final url = Uri.parse('https://admin.edyone.site/api/student/get-data');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer fKlw0WyyLhFDZCCuwfKBBlWaREbcj8yn8xPWrVsS',
        'Content-Type': 'application/json',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder<Map<String, dynamic>>(
        future: _userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          final userData = snapshot.data!;

          return Container(
            width: 388,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                    'Date of Birth', userData['date_of_birth'], 'icon/dob.png'),
                _buildInfoRow('Gender', userData['gender'], 'icon/gen.png'),
                _buildInfoRow(
                    'Email ID', userData['email'], 'icon/mailing.png'),
                _buildInfoRow(
                    'Mobile Number', userData['mobile_no'], 'icon/phn.png'),
                _buildInfoRow(
                    'Address', userData['address'], 'icon/address.png'),
                _buildInfoRow(
                    'Education State', userData['state'], 'icon/edu1.png'),
                _buildInfoRow(
                    'Education Board', userData['board'], 'icon/edu2.png'),
                _buildInfoRow(
                    'Standard/Class', userData['class'], 'icon/edu3.png'),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton('Edit Profile', Icons.edit),
                    SizedBox(width: 8),
                    _buildResetPasswordButton(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, String iconPath) {
    return Container(
      width: 388,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    iconPath,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 6),
              Container(
                height: 17,
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 21 / 14,
                  ),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 24 / 16,
              letterSpacing: 0.01,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon) {
    return Container(
      width: 172,
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          colors: [Color(0xFFA10048), Color(0xFF2300FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8),
          Icon(icon, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildResetPasswordButton() {
    return Container(
      width: 172,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          colors: [Color(0xFFA10048), Color(0xFF2300FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(
                  Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Reset Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      letterSpacing: 0.01,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Transform.rotate(
                    angle: 120 * 3.14159 / 180,
                    child: Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
