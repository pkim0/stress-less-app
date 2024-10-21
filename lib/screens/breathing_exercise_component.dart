import 'package:flutter/material.dart';
import 'dart:async';

class BreathingExerciseComponent extends StatefulWidget {
  const BreathingExerciseComponent({super.key});

  @override
  _BreathingExerciseComponentState createState() =>
      _BreathingExerciseComponentState();
}

class _BreathingExerciseComponentState
    extends State<BreathingExerciseComponent> {
  late Timer _timer;
  String _breathState = "Inhale";
  int _counter = 5;
  bool _isRunning = true;

  @override
  void initState() {
    super.initState();
    _startBreathingCycle();
  }

  void _startBreathingCycle() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isRunning) {
        setState(() {
          if (_counter > 1) {
            _counter--;
          } else {
            _counter = 5;
            _breathState = _breathState == "Inhale" ? "Exhale" : "Inhale";
          }
        });
      }
    });
  }

  void _toggleBreathing() {
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _breathState,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '$_counter',
            style: const TextStyle(fontSize: 32, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _toggleBreathing,
            child: Text(_isRunning ? 'Pause' : 'Resume'),
          ),
        ],
      ),
    );
  }
}
