import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart'; // Import just_audio package.

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioPlayer _player = AudioPlayer(); // Audio player instance.

  @override
  void dispose() {
    _player.dispose(); // Release resources when the widget is disposed.
    super.dispose();
  }

  Future<void> playSound(String assetPath) async {
    try {
      await _player.setAsset(assetPath); // Load the audio asset.
      _player.play(); // Play the audio.
      print('Playing: $assetPath');
    } catch (e) {
      print('Error playing sound: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Soundscapes',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => playSound('assets/sounds/rain.mp3'),
            child: const Text('Rain Sound'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => playSound('assets/sounds/forest.mp3'),
            child: const Text('Forest Sound'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => playSound('assets/sounds/ocean.mp3'),
            child: const Text('Ocean Sound'),
          ),
        ],
      ),
    );
  }
}
