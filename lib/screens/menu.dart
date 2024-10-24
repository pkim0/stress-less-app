import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart'; // Import just_audio package.
import 'breathing_exercise_component.dart'; // Import Breathing Exercise.
import 'about_screen.dart'; // Import About Screen.
import 'home_screen.dart'; // Import Home Screen.
import 'audio_screen.dart'; // Import Audio Screen.
import 'meditation_screen.dart'; // Import Meditation Screen.
import 'affirmations_screen.dart'; // Import Affirmations Screen.

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final AudioPlayer _player = AudioPlayer(); // Audio player instance.

  @override
  void dispose() {
    _player.dispose(); // Release resources.
    super.dispose();
  }

  // Method to navigate to different screens.
  void _navigateTo(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calmify'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: () async {
              await _player.stop(); // Stop audio playback.
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Text(
                'Calmify Menu',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => _navigateTo(const HomeScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.self_improvement),
              title: const Text('Breathing Exercise'),
              onTap: () => _navigateTo(const BreathingExerciseComponent()),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () => _navigateTo(const AboutScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.audiotrack),
              title: const Text('Audio'),
              onTap: () => _navigateTo(const AudioScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.format_quote),
              title: const Text('Affirmations'),
              onTap: () => _navigateTo(const AffirmationsScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.spa),
              title: const Text('Meditation'),
              onTap: () => _navigateTo(
                  const MeditationScreen()), // Navigate to Meditation Screen.
            ),
          ],
        ),
      ),
      body: const HomeScreen(), // Default body is Home Screen.
    );
  }
}
