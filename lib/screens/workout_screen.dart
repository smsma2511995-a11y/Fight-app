import 'dart:async'; // لاستخدام المؤقت
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart'; // للعداد الدائري
import 'package:fight_app/models/exercise_model.dart';

class WorkoutScreen extends StatefulWidget {
  final MartialArtsExercise exercise;

  const WorkoutScreen({super.key, required this.exercise});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late Timer _timer;
  int _currentSeconds = 0;

  @override
  void initState() {
    super.initState();
    // ابدأ العداد فور فتح الشاشة
    startTimer();
  }

  @override
  void dispose() {
    // تأكد من إلغاء المؤقت عند إغلاق الشاشة لمنع تسريب الذاكرة
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _currentSeconds = widget.exercise.duration; // ابدأ من مدة التمرين
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentSeconds > 0) {
        setState(() {
          _currentSeconds--;
        });
      } else {
        // عندما ينتهي الوقت، أوقف المؤقت
        timer.cancel();
        _showCompletionDialog();
      }
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("أحسنت!"),
          content: const Text("لقد أكملت التمرين بنجاح."),
          actions: <Widget>[
            TextButton(
              child: const Text("إغلاق"),
              onPressed: () {
                Navigator.of(context).pop(); // يغلق الحوار
                Navigator.of(context).pop(); // يعود إلى شاشة التفاصيل
              },
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // حساب النسبة المئوية للعداد الدائري
    double percent = _currentSeconds / widget.exercise.duration;

    return Scaffold(
      backgroundColor: Colors.black, // خلفية سوداء للتركيز
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.exercise.nameAr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // صورة GIF كبيرة
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  widget.exercise.gifUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 50),

              // العداد الدائري
              CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 15.0,
                percent: percent,
                center: Text(
                  "$_currentSeconds",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                progressColor: Colors.red.shade700,
                backgroundColor: Colors.grey.shade800,
                circularStrokeCap: CircularStrokeCap.round,
                animation: false, // لا نريد حركة للعداد نفسه
              ),
              const SizedBox(height: 30),

              ElevatedButton.icon(
                icon: const Icon(Icons.stop),
                label: const Text("إنهاء التمرين"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade900,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: () {
                  // العودة إلى الشاشة السابقة
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
                  
