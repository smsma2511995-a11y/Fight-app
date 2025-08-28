import 'package:flutter/material.dart';
import 'package:fight_app/models/exercise_model.dart';
import 'package:fight_app/screens/workout_screen.dart'; // استيراد الشاشة الجديدة

class ExerciseDetailScreen extends StatelessWidget {
  final MartialArtsExercise exercise;

  const ExerciseDetailScreen({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.nameAr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                exercise.gifUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: Colors.grey[800],
                    alignment: Alignment.center,
                    child: const Text('لم يتم العثور على الصورة', style: TextStyle(color: Colors.white)),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            Text(
              exercise.nameAr,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              exercise.nameEn,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[400]),
            ),
            const Divider(height: 30, thickness: 1),

            _buildDetailRow('الفئة', exercise.category),
            _buildDetailRow('المستوى', exercise.difficulty),
            _buildDetailRow('المدة', '${exercise.duration} ثانية'),
            _buildDetailRow('السعرات (تقريبي)', '${exercise.calories} سعر حراري'),
            _buildDetailRow('المعدات', exercise.equipment),
            const SizedBox(height: 10),
            _buildDetailRow('العضلات المستهدفة', exercise.targetMuscles.join('، ')),

            // --- هذا هو الزر الجديد ---
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow),
                label: const Text("ابدأ التمرين"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18, fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutScreen(exercise: exercise),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
