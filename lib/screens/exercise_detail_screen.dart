import 'package:flutter/material.dart';
import 'package:fight_app/models/exercise_model.dart';

class ExerciseDetailScreen extends StatelessWidget {
  // هذه الشاشة ستستقبل "بطاقة تعريف" التمرين الذي تم الضغط عليه
  final MartialArtsExercise exercise;

  const ExerciseDetailScreen({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // عنوان الصفحة هو اسم التمرين بالعربي
        title: Text(exercise.nameAr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- عرض صورة الـ GIF ---
            // ملاحظة: هذا سيعمل فقط بعد أن تضيف مجلد assets/gifs إلى مشروعك
            // في الوقت الحالي، سنضع حاوية مؤقتة
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[800],
              alignment: Alignment.center,
              child: const Text(
                'مكان عرض صورة GIF',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              // يمكنك تفعيل السطر التالي بعد إضافة الصور
              // child: Image.asset(exercise.gifPath, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),

            // --- عرض اسم التمرين ---
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

            // --- عرض تفاصيل التمرين ---
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
