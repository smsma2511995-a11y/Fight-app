import 'package:flutter/material.dart';
import '../models/exercise_model.dart';
import 'workout_screen.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailScreen({required this.exercise, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exercise.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GIF أو فيديو أو أيقونة افتراضية
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: exercise.gif != null
                  ? Image.network(exercise.gif!, fit: BoxFit.cover)
                  : const Center(
                      child: Icon(Icons.sports_mma_outlined, size: 80, color: Colors.grey),
                    ),
            ),
            const SizedBox(height: 16),
            Text('نوع التمرين: ${exercise.type}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text('العدد / الوقت: ${exercise.value}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WorkoutScreen(exercise: exercise)),
                );
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('ابدأ التمرين'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
