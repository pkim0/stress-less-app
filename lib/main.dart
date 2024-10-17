import 'package:flutter/material.dart';

void main() {
  runApp(CalmifyApp());
}

class CalmifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calmify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calmify - Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to Mindfulness Exercises
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MindfulnessScreen()),
                );
              },
              child: Text('Mindfulness Exercises'),
            ),
            SizedBox(height: 20), // Add some spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to Breathing Exercises
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BreathingScreen()),
                );
              },
              child: Text('Breathing Exercises'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Daily Affirmations
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AffirmationsScreen()),
                );
              },
              child: Text('Daily Affirmations'),
            ),
          ],
        ),
      ),
    );
  }
}

class MindfulnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindfulness Exercises'),
      ),
      body: Center(
        child: Text('List of Mindfulness Exercises here'),
      ),
    );
  }
}

class BreathingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breathing Exercises'),
      ),
      body: Center(
        child: Text('Breathing Exercise Guide here'),
      ),
    );
  }
}

class AffirmationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Affirmations'),
      ),
      body: Center(
        child: Text('Your Daily Affirmation here'),
      ),
    );
  }
}
