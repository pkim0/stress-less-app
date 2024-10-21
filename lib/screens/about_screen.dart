import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'This app helps you relax with calming sounds and breathing exercises.\nDeveloped by Calmify.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: Colors.black54),
      ),
    );
  }
}
