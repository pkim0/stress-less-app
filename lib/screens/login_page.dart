import 'package:flutter/material.dart';
import 'soundscapes_screen.dart'; // Import the main app screen.

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Calmify',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the main SoundScapeScreen.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SoundScapeScreen(),
                  ),
                );
              },
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}
