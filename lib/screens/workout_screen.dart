import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:fight_app/models/exercise_model.dart';
import 'package:just_audio/just_audio.dart'; // لاستيراد مشغل الصوت
import 'package:flutter_tts/flutter_tts.dart'; // لاستيراد محرك النطق

class WorkoutScreen extends StatefulWidget {
  final MartialArtsExercise exercise;

  const WorkoutScreen({super.key, required this.exercise});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late Timer _timer;
  int _currentSeconds = 0;
  
  // تهيئة مشغل الصوت ومحرك النطق
  final AudioPlayer _audioPlayer = AudioPlayer();
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _setupSound();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer.dispose(); // تأكد من إغلاق مشغل الصوت
    super.dispose();
  }

  // دالة لتجهيز الأصوات والنطق
  Future<void> _setupSound() async {
    // تجهيز محرك النطق
    await _flutterTts.setLanguage("en-US"); // نطق اسم التمرين بالإنجليزية
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setPitch(1.0);
  }

  // دالة لتشغيل صوت من الإنترنت
  Future<void> _playSound(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      _audioPlayer.play();
    } catch (e) {
      print("Error playing sound: $e");
    }
  }
  
  void startTimer() {
    _currentSeconds = widget.exercise.duration;
    
    // --- هذا هو التعديل الرئيسي ---
    // نطق اسم التمرين وتشغيل صوت البداية
    _flutterTts.speak(widget.exercise.nameEn);
    _playSound("https://actions.google.com/sounds/v1/alarms/digital_watch_alarm_long.ogg");

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentSeconds > 0) {
        setState(() {
          _currentSeconds--;
        });
      } else {
        timer.cancel();
        // تشغيل صوت النهاية
        _playSound("https://actions.google.com/sounds/v1/alarms/alarm_clock.ogg");
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
  Widget build(BuildContext context) {
    double percent = _currentSeconds / widget.exercise.duration;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.exercise.nameAr,
                style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

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

              CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 15.0,
                percent: percent,
                center: Text(
                  "$_currentSeconds",
                  style: const TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
                progressColor: Colors.red.shade700,
                backgroundColor: Colors.grey.shade800,
                circularStrokeCap: CircularStrokeCap.round,
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
