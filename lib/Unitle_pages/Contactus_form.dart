import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

class Contactusform extends StatefulWidget {
  const Contactusform({super.key});

  @override
  State<Contactusform> createState() => _ContactusformState();
}

class _ContactusformState extends State<Contactusform> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<File> _images = [];
  List<String> _imageUrls = [];

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final picker = html.FileUploadInputElement()
        ..accept = 'assets/upload_image/*';
      picker.click();

      picker.onChange.listen((event) {
        final file = picker.files!.first;
        final reader = html.FileReader();

        reader.readAsDataUrl(file);
        reader.onLoadEnd.listen((event) {
          setState(() {
            _imageUrls.add(reader.result as String);
          });
        });
      });
    } else {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _images.add(File(pickedFile.path));
        });
      }
    }
  }

  Future<void> _submitForm() async {
    final String subject = _subjectController.text;
    final String description = _descriptionController.text;

    // Retrieve the token from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Token not found')),
      );
      return;
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://admin.edyone.site/api/admin/contact-us'),
    );

    request.headers['Authorization'] = 'Bearer $token';

    request.fields['subject_contact'] = subject;
    request.fields['description_contact'] = description;

    for (var image in _images) {
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
    }

    for (var imageUrl in _imageUrls) {
      request.fields['image_url'] = imageUrl;
    }

    try {
      var response = await request.send();

      // Print the response body
      var responseBody = await response.stream.bytesToString();
      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');

      // Display the response message
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Form submitted successfully')),
        );
        _resetForm();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit form: $responseBody')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting form: $e')),
      );
    }
  }

  void _resetForm() {
    _subjectController.clear();
    _descriptionController.clear();
    setState(() {
      _images.clear();
      _imageUrls.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 11, left: 10, right: 10),
          constraints: const BoxConstraints(
            maxHeight: 40,
            maxWidth: 388,
          ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFADADAD)),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _subjectController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Subject',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color(0xFFADADAD),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 11),
        Container(
          margin: const EdgeInsets.only(top: 11, left: 10, right: 10),
          constraints: const BoxConstraints(
            maxHeight: 72,
            maxWidth: 388,
          ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFADADAD)),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Enter Description',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color(0xFFADADAD),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: _pickImage,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        if (_images.isNotEmpty || _imageUrls.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ..._images.map((image) {
                  return Image.file(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  );
                }).toList(),
                ..._imageUrls.map((imageUrl) {
                  return Image.network(
                    imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  );
                }).toList(),
              ],
            ),
          ),
        const SizedBox(height: 15),
        Center(
          child: GestureDetector(
            onTap: _submitForm,
            child: Container(
              width: 335,
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              margin: const EdgeInsets.only(top: 0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFA10048), Color(0xFF2300FF)],
                ),
              ),
              child: const Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
