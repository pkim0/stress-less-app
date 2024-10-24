import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart'; // Reuse your audio player.
import 'dart:async'; // For timers if needed.

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final AudioPlayer _player = AudioPlayer(); // Use existing audio player.
  Timer? _timer;
  bool _isPlaying = false; // Track play/pause state.
  double _progress = 0.0; // Progress of the audio (0 to 1).
  int _remainingTime = 0; // Track remaining session time.
  String? _currentSession; // Track the current session audio path.

  // List of meditation tips.
  final List<String> meditationTips = [
    "1. Find a quiet and comfortable place to sit.",
    "2. Close your eyes and take a few deep breaths.",
    "3. Focus on your breathing – inhale deeply and exhale slowly.",
    "4. Let go of any wandering thoughts without judgment.",
    "5. Use a mantra to keep yourself centered (e.g., 'peace' or 'calm').",
    "6. Slowly scan your body from head to toe, relaxing each part.",
    "7. Practice gratitude at the end of each session.",
  ];

  // List of available meditation audio sessions.
  final List<Map<String, dynamic>> sessions = [
    {
      "title": "Morning Calm",
      "duration": 300,
      "audio": "assets/sounds/morning.mp3"
    }, // 5 mins
    {
      "title": "Evening Reflection",
      "duration": 600,
      "audio": "assets/sounds/evening.mp3"
    }, // 10 mins
    {
      "title": "Deep Focus",
      "duration": 900,
      "audio": "assets/sounds/focus.mp3"
    }, // 15 mins
  ];

  // Start playing a meditation session.
  Future<void> startSession(String audioPath, int duration) async {
    if (_currentSession != null) {
      _timer?.cancel();
      _player.stop();
    }

    setState(() {
      _progress = 0.0;
      _remainingTime = duration;
      _isPlaying = true;
      _currentSession = audioPath;
    });

    await _player.setAsset(audioPath);
    _player.play();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 1) {
          _remainingTime--;
          _progress += 1 / duration;
        } else {
          _timer?.cancel();
          _player.stop();
          _isPlaying = false;
          _currentSession = null;
        }
      });
    });
  }

  // Toggle play/pause for the current session.
  void togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
    if (_isPlaying) {
      _player.play();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_remainingTime > 1) {
            _remainingTime--;
            _progress += 1 / _remainingTime;
          } else {
            _timer?.cancel();
            _player.stop();
            _isPlaying = false;
            _currentSession = null;
          }
        });
      });
    } else {
      _player.pause();
      _timer?.cancel();
    }
  }

  // Resume the current session.
  void resumeSession() {
    setState(() {
      _isPlaying = true;
    });
    _player.play();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meditation Tips',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: meditationTips.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.spa, color: Colors.green),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            meditationTips[index],
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Meditation Sessions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  final session = sessions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(session["title"]),
                      trailing: const Icon(Icons.play_arrow),
                      onTap: () => startSession(
                        session["audio"],
                        session["duration"],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            if (_isPlaying || _remainingTime > 0)
              Column(
                children: [
                  Text(
                    'Time Remaining: ${(_remainingTime ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: _progress,
                    minHeight: 10,
                    backgroundColor: Colors.grey[300],
                    color: Colors.lightBlueAccent,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: togglePlayPause,
                    icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                    label: Text(_isPlaying ? 'Pause' : 'Resume'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
