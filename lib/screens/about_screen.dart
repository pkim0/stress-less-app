import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: const Text(
          'Calmify offers a guided breathing exercise, soothing soundscapes, positive affirmations, and meditation tips to help you unwind and find peace.\n\nDeveloped by\nG. Hari Surya Bharadwaj\n& Peter Kim',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}
