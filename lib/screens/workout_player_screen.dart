import 'dart:async';
import 'package:flutter/material.dart';
import 'package:integrated_martial_arts_trainer/data/exercises_seed.dart'; // Ensure you have this file

class WorkoutPlayerScreen extends StatefulWidget {
  const WorkoutPlayerScreen({super.key});

  @override
  State<WorkoutPlayerScreen> createState() => _WorkoutPlayerScreenState();
}

class _WorkoutPlayerScreenState extends State<WorkoutPlayerScreen> {
  int _currentExerciseIndex = 0;
  // Let's use a sample workout list for demonstration
  final List<Exercise> _workoutPlan = allExercises.where((ex) => ex.category == "الكاراتيه").take(5).toList();
  
  Timer? _timer;
  int _secondsRemaining = 0;
  bool _isPaused = true;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = _workoutPlan[_currentExerciseIndex].durationSeconds;
  }
  
  void _startTimer() {
    setState(() {
      _isPaused = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        _nextExercise();
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isPaused = true;
    });
  }
  
  void _nextExercise()
