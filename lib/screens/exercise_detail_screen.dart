import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../models/exercise_model.dart';
import '../services/tts_service.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final Exercise exercise;

  ExerciseDetailScreen({required this.exercise});

  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  VideoPlayerController? _controller;
  final tts = TTSService();

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  Future<void> _loadVideo() async {
    try {
      final file = await DefaultCacheManager().getSingleFile(widget.exercise.videoUrl);
      _controller = VideoPlayerController.file(file)
        ..initialize().then((_) {
          setState(() {});
        });
    } catch (e) {
      print("Video error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _controller != null && _controller!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  )
                : Center(child: CircularProgressIndicator()),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.exercise.description,
                style: TextStyle(fontSize: 18),
              ),
            ),

            Center(
              child: ElevatedButton.icon(
                onPressed: () => tts.speak(widget.exercise.description),
                icon: Icon(Icons.volume_up),
                label: Text("تشغيل الوصف صوتيًا"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    tts.stop();
    super.dispose();
  }
}
