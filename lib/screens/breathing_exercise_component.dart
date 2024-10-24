import 'package:flutter/material.dart';
import 'dart:async';

class BreathingExerciseComponent extends StatefulWidget {
  const BreathingExerciseComponent({super.key});

  @override
  _BreathingExerciseComponentState createState() =>
      _BreathingExerciseComponentState();
}

class _BreathingExerciseComponentState
    extends State<BreathingExerciseComponent> with SingleTickerProviderStateMixin {
  late Timer _timer;
  String _breathState = "Inhale";
  int _counter = 5;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Duration for inhale and exhale
    );
    _animation = Tween<double>(begin: 50.0, end: 300.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _startBreathingCycle();
    _animationController.forward();
  }

  void _startBreathingCycle() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        setState(() {
          if (_counter > 1) {
            _counter--;
          } else {
            if (_breathState == "Inhale") {
              _counter = 5;
              _breathState = "Exhale";
              _animationController.reverse();
            } else {
              _counter = 5;
              _breathState = "Inhale";
              _animationController.forward();
            }
          }
        });
      }
    });
  }

  void _pauseBreathing() {
    setState(() {
      _isPaused = true;
      _animationController.stop();
    });
  }

  void _resumeBreathing() {
    setState(() {
      _isPaused = false;
      if (_breathState == "Inhale") {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Make the column take minimum space
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
              style: const TextStyle(fontSize: 32, color: Color.fromARGB(136, 0, 0, 0)),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300.0, // Fixed width to prevent moving other elements
              height: 300.0, // Fixed height to prevent moving other elements
              child: Center(
                child: Container(
                  width: _animation.value,
                  height: _animation.value,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isPaused ? _resumeBreathing : _pauseBreathing,
                  child: Text(_isPaused ? 'Resume' : 'Pause'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
