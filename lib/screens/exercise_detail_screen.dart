import 'package:flutter/material.dart';
import 'package.fight_app/models/exercise_model.dart';

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
            
            // --- تم التعديل هنا ليعرض صورة GIF من الإنترنت ---
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network( // <-- يستخدم Image.network لتحميل الصور من رابط
                exercise.gifUrl,    // <-- يستخدم خاصية gifUrl الجديدة
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                // هذا يظهر أثناء تحميل الصورة
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 250,
                    color: Colors.grey[800],
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                },
                // هذا يظهر في حالة فشل التحميل
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: Colors.grey[800],
                    alignment: Alignment.center,
                    child: const Icon(Icons.error, color: Colors.white, size: 50),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            Text(
              exercise.nameAr,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              exercise.nameEn,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[400],
              ),
            ),
            const Divider(height: 30, thickness: 1),

            _buildDetailRow('الفئة', exercise.category),
            _buildDetailRow('المستوى', exercise.difficulty),
            _buildDetailRow('المدة', '${exercise.duration} ثانية'),
            _buildDetailRow('السعرات (تقريبي)', '${exercise.calories} سعر حراري'),
            _buildDetailRow('المعدات', exercise.equipment),
            const SizedBox(height: 10),
            _buildDetailRow('العضلات المستهدفة', exercise.targetMuscles.join('، ')),
          ],
        ),
      ),
    );
  }

  // دالة مساعدة لبناء صفوف التفاصيل بشكل منسق
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
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
