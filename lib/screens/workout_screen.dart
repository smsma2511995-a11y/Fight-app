import 'dart:async';
import 'package.flutter/material.dart';
import 'package.percent_indicator/circular_percent_indicator.dart';
import 'package.fight_app/models/exercise_model.dart';
import 'package.fight_app/data/database_helper.dart'; // استيراد مدير قاعدة البيانات
import 'package.just_audio/just_audio.dart';
import 'package.flutter_tts/flutter_tts.dart';

class WorkoutScreen extends StatefulWidget {
  final MartialArtsExercise exercise;
  const WorkoutScreen({super.key, required this.exercise});
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late Timer _timer;
  int _currentSeconds = 0;
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
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _setupSound() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
  }

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
    _flutterTts.speak(widget.exercise.nameEn);
    _playSound("https://actions.google.com/sounds/v1/alarms/digital_watch_alarm_long.ogg");
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentSeconds > 0) {
        setState(() => _currentSeconds--);
      } else {
        timer.cancel();
        _playSound("https://actions.google.com/sounds/v1/alarms/alarm_clock.ogg");
        
        // --- هذا هو التعديل الرئيسي ---
        // تسجيل التمرين المكتمل في قاعدة البيانات
        DatabaseHelper().logExercise(
          widget.exercise.id,
          widget.exercise.nameAr,
          widget.exercise.duration,
          widget.exercise.calories,
        );

        _showCompletionDialog();
      }
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("أحسنت!"),
        content: const Text("لقد أكملت التمرين بنجاح."),
        actions: [
          TextButton(
            child: const Text("إغلاق"),
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
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
                center: Text("$_currentSeconds", style: const TextStyle(color: Colors.white, fontSize: 50.0)),
                progressColor: Colors.red.shade700,
                backgroundColor: Colors.grey.shade800,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.stop),
                label: const Text("إنهاء التمرين"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
