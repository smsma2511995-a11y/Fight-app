import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fight_app/models/exercise_model.dart';
import 'package:fight_app/data/database_helper.dart';

class WorkoutScreen extends StatefulWidget {
  final MartialArtsExercise exercise;

  const WorkoutScreen({super.key, required this.exercise});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  static const int exerciseDuration = 60; // دقيقة واحدة (60 ثانية)
  late int _currentSeconds;
  Timer? _timer;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _currentSeconds = exerciseDuration;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentSeconds > 0) {
        setState(() {
          _currentSeconds--;
        });
      } else {
        setState(() {
          _isCompleted = true;
        });
        _timer?.cancel();
        DatabaseHelper().logExercise(widget.exercise); // حفظ في الداتا بيز
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double percent =
        _currentSeconds > 0 ? _currentSeconds / exerciseDuration : 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.exercise.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (widget.exercise.gifUrl.isNotEmpty)
              Image.network(widget.exercise.gifUrl, height: 200),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: percent,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              '$_currentSeconds ثانية متبقية',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 40),
            if (_isCompleted)
              const Text(
                'التمرين انتهى ✔',
                style: TextStyle(fontSize: 24, color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
