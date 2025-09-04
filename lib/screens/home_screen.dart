import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helpers/database_helper.dart';
import '../models/exercise.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Exercise> _exercises = [];

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  void _loadExercises() async {
    final data = await DatabaseHelper().getExercises();
    setState(() { _exercises = data; });
  }

  void _addDummyExercise() async {
    await DatabaseHelper().insertExercise(Exercise(
      name: 'تمرين جديد',
      description: 'وصف التمرين هنا',
      videoUrl: 'https://www.youtube.com/',
    ));
    _loadExercises();
  }

  void _deleteExercise(int id) async {
    await DatabaseHelper().deleteExercise(id);
    _loadExercises();
  }

  void _deleteAllExercises() async {
    await DatabaseHelper().deleteAll();
    _loadExercises();
  }

  void _showDetails(Exercise ex) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(ex.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(ex.description),
            SizedBox(height: 10),
            if (ex.videoUrl != '') ElevatedButton.icon(
              icon: Icon(Icons.play_arrow),
              label: Text('تشغيل الفيديو'),
              onPressed: () async {
                if (await canLaunch(ex.videoUrl)) await launch(ex.videoUrl);
              },
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق')),
          TextButton(onPressed: () { _deleteExercise(ex.id!); Navigator.pop(context); }, child: Text('حذف')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الرئيسية'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: _addDummyExercise),
          IconButton(icon: Icon(Icons.delete_sweep), onPressed: _deleteAllExercises),
        ],
      ),
      body: _exercises.isEmpty
          ? Center(child: Text('لا يوجد تمارين بعد'))
          : Padding(
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: _exercises.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 8, mainAxisSpacing: 8
                ),
                itemBuilder: (context, index) {
                  final ex = _exercises[index];
                  return GestureDetector(
                    onTap: () => _showDetails(ex),
                    child: Card(
                      color: Colors.blueAccent,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(ex.name, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
