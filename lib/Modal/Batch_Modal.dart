// custom_modal.dart
import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  final String title;
  final String content;

  CustomModal({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
