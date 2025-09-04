import 'dart:async';
import 'package:flutter/material.dart';
import '../data/all_exercises.dart';
import '../models/exercise.dart';

class WorkoutPlayerScreen extends StatefulWidget {
  const WorkoutPlayerScreen({super.key});

  @override
  State<WorkoutPlayerScreen> createState() => _WorkoutPlayerScreenState();
}

class _WorkoutPlayerScreenState extends State<WorkoutPlayerScreen> {
  int _currentExerciseIndex = 0;
  final List<Exercise> _workoutPlan = allExercisesList.where((ex) => ex.category == "كاراتيه" || ex.category == "الكاراتيه").take(5).toList();

  Timer? _timer;
  int _secondsRemaining = 0;
  bool _isPaused = true;

  @override
  void initState() {
    super.initState();
    if (_workoutPlan.isNotEmpty) {
      _secondsRemaining = _workoutPlan[_currentExerciseIndex].durationSeconds ?? 30;
    }
  }

  void _startTimer() {
    if (_workoutPlan.isEmpty) return;
    setState(() {
      _isPaused = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
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

  void _nextExercise() {
    _timer?.cancel();
    if (_currentExerciseIndex < _workoutPlan.length - 1) {
      setState(() {
        _currentExerciseIndex++;
        _secondsRemaining = _workoutPlan[_currentExerciseIndex].durationSeconds ?? 30;
        _isPaused = true;
      });
    } else {
      _showWorkoutCompleteDialog();
    }
  }

  void _previousExercise() {
    if (_currentExerciseIndex > 0) {
      _timer?.cancel();
      setState(() {
        _currentExerciseIndex--;
        _secondsRemaining = _workoutPlan[_currentExerciseIndex].durationSeconds ?? 30;
        _isPaused = true;
      });
    }
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor().toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  void _showWorkoutCompleteDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("أحسنت صنعاً!"),
          content: const Text("لقد أكملت تمرين اليوم بنجاح."),
          actions: <Widget>[
            TextButton(
              child: const Text("إنهاء"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_workoutPlan.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text("لا توجد تمارين متاحة في هذه الخطة.")),
      );
    }

    final currentExercise = _workoutPlan[_currentExerciseIndex];
    final img = currentExercise.displayImage;

    return Scaffold(
      appBar: AppBar(
        title: const Text('وضع التمرين'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _pauseTimer();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: img != null
                    ? Image.network(img, fit: BoxFit.contain, errorBuilder: (_, __, ___) => const Icon(Icons.fitness_center, size: 100))
                    : const Icon(Icons.fitness_center, size: 100, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              currentExercise.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              _formatTime(_secondsRemaining),
              style: const TextStyle(fontSize: 72, fontWeight: FontWeight.w900, fontFamily: 'monospace'),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: const Icon(Icons.skip_previous), iconSize: 40, onPressed: _previousExercise),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: _isPaused ? _startTimer : _pauseTimer,
                    child: Icon(_isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded, size: 40),
                    style: ElevatedButton.styleFrom(shape: const CircleBorder(), padding: const EdgeInsets.all(8)),
                  ),
                ),
                IconButton(icon: const Icon(Icons.skip_next), iconSize: 40, onPressed: _nextExercise),
              ],
            )
          ],
        ),
      ),
    );
  }
}
