import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/exercise.dart';
import '../services/tts_service.dart';
import 'exercise_detail_screen.dart';
import '../data/all_exercises.dart';

class WorkoutScreen extends StatelessWidget {
  final List<Exercise>? exercises;

  WorkoutScreen({this.exercises});

  @override
  Widget build(BuildContext context) {
    final tts = TTSService();
    final List<Exercise> items = exercises ?? allExercisesList;

    return Scaffold(
      appBar: AppBar(
        title: Text("تمارين اليوم"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final ex = items[index];
          final img = ex.displayImage;
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: img != null && img.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: img,
                      placeholder: (ctx, url) => SizedBox(width: 40, height: 40, child: CircularProgressIndicator()),
                      errorWidget: (ctx, url, err) => Icon(Icons.error),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  : CircleAvatar(child: Icon(Icons.sports_mma)),
              title: Text(ex.name),
              subtitle: Text(ex.description, maxLines: 1, overflow: TextOverflow.ellipsis),
              trailing: IconButton(
                icon: Icon(Icons.volume_up, color: Colors.deepPurple),
                onPressed: () {
                  tts.speak(ex.description);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExerciseDetailScreen(exercise: ex),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
