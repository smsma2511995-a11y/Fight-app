import 'dart:async';
import 'package:flutter/material.dart';
import 'package:integrated_martial_arts_trainer/data/exercises_seed.dart';

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
    // Initialize with the duration of the first exercise
    if (_workoutPlan.isNotEmpty) {
      _secondsRemaining = _workoutPlan[_currentExerciseIndex].durationSeconds;
    }
  }
  
  void _startTimer() {
    if (_workoutPlan.isEmpty) return; // Don't start if there's no plan
    setState(() {
      _isPaused = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        // Automatically move to the next exercise when timer ends
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
        _secondsRemaining = _workoutPlan[_currentExerciseIndex].durationSeconds;
        _isPaused = true;
      });
    } else {
      // Workout is complete
      _showWorkoutCompleteDialog();
    }
  }

  void _previousExercise() {
    if (_currentExerciseIndex > 0) {
      _timer?.cancel();
      setState(() {
        _currentExerciseIndex--;
        _secondsRemaining = _workoutPlan[_currentExerciseIndex].durationSeconds;
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
      barrierDismissible: false, // User must tap button to close
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("أحسنت صنعاً!"),
          content: const Text("لقد أكملت تمرين اليوم بنجاح."),
          actions: <Widget>[
            TextButton(
              child: const Text("إنهاء"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Go back from the player screen
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Important: cancel the timer to avoid memory leaks
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Handle case where workout plan might be empty
    if (_workoutPlan.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text("لا توجد تمارين متاحة في هذه الخطة.")),
      );
    }
    
    final currentExercise = _workoutPlan[_currentExerciseIndex];

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
            // GIF/Image Area
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  currentExercise.imagePath,
                  fit: BoxFit.contain,
                  // Gracefully handle if an image asset is missing
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.fitness_center, size: 100, color: Colors.grey);
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Exercise Name
            Text(
              currentExercise.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Timer Display
            Text(
              _formatTime(_secondsRemaining),
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.w900,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 24),

            // Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 40,
                  onPressed: _previousExercise,
                  color: Colors.grey.shade600,
                ),
                // Main Play/Pause Button
                SizedBox(
                  width: 80,
                  height: 80,
                  child: IconButton(
                    icon: Icon(_isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded),
                    iconSize: 50,
                    style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: _isPaused ? _startTimer : _pauseTimer,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  iconSize: 40,
                  onPressed: _nextExercise,
                  color: Colors.grey.shade600,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
