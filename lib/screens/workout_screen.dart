import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/exercise_model.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class WorkoutScreen extends StatefulWidget {
  final Exercise exercise;

  const WorkoutScreen({required this.exercise, super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  VideoPlayerController? _controller;
  bool _isVideo = false;

  @override
  void initState() {
    super.initState();
    _loadMedia();
  }

  Future<void> _loadMedia() async {
    // ✅ إذا التمرين فيه فيديو (مسار محلي أو URL)
    if (widget.exercise.video != null) {
      _isVideo = true;
      // تحميل الفيديو مع cache تلقائي
      final file = await DefaultCacheManager().getSingleFile(widget.exercise.video!);
      _controller = VideoPlayerController.file(file)
        ..initialize().then((_) {
          setState(() {});
          _controller!.play();
        });
    } 
    // ✅ إذا التمرين فيه GIF فقط (محلي من assets)
    else if (widget.exercise.gif != null) {
      _isVideo = false;
      setState(() {}); // GIF ستظهر مباشرة
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.exercise.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // منطقة عرض الفيديو أو GIF
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: _isVideo
                  ? (_controller != null && _controller!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        )
                      : const Center(child: CircularProgressIndicator()))
                  : widget.exercise.gif != null
                      ? Image.asset(widget.exercise.gif!, fit: BoxFit.cover)
                      : const Icon(Icons.sports_mma_outlined, size: 80, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text('ابدأ التمرين الآن', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 8),
            // زر تشغيل/إيقاف الفيديو (أو مجرد إظهار GIF)
            ElevatedButton(
              onPressed: () {
                if (_isVideo && _controller != null) {
                  if (_controller!.value.isPlaying) {
                    _controller!.pause();
                  } else {
                    _controller!.play();
                  }
                  setState(() {});
                }
              },
              child: Text(_isVideo
                  ? (_controller != null && _controller!.value.isPlaying ? 'إيقاف الفيديو' : 'تشغيل الفيديو')
                  : 'تمرين GIF'),
            ),
          ],
        ),
      ),
    );
  }
}
