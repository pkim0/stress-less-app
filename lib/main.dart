import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Import the splash screen.
import 'screens/login_page.dart'; // Import the login page.

void main() {
  runApp(const StressReliefApp());
}

class StressReliefApp extends StatelessWidget {
  const StressReliefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calmify',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(), // Set the Login Page as the first page.
    );
  }
}