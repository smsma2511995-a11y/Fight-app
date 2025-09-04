import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/exercise_model.dart';
import '../services/tts_service.dart';
import 'exercise_detail_screen.dart';

class WorkoutScreen extends StatelessWidget {
  final List<Exercise> exercises;

  WorkoutScreen({required this.exercises});

  @override
  Widget build(BuildContext context) {
    final tts = TTSService();

    return Scaffold(
      appBar: AppBar(
        title: Text("تمارين اليوم"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final ex = exercises[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: ex.imageUrl,
                placeholder: (ctx, url) => CircularProgressIndicator(),
                errorWidget: (ctx, url, err) => Icon(Icons.error),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
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
