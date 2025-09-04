import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق التمارين',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

// ------------------ Database Helper ------------------
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'exercises.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE exercises(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,
            videoUrl TEXT
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> getExercises() async {
    final db = await database;
    return await db.query('exercises', orderBy: 'id DESC');
  }

  Future<int> insertExercise(Map<String, dynamic> exercise) async {
    final db = await database;
    return await db.insert('exercises', exercise);
  }

  Future<int> deleteExercise(int id) async {
    final db = await database;
    return await db.delete('exercises', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete('exercises');
  }
}

// ------------------ Home Screen ------------------
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _exercises = [];

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  void _loadExercises() async {
    final data = await DatabaseHelper().getExercises();
    setState(() {
      _exercises = data;
    });
  }

  void _addDummyExercise() async {
    await DatabaseHelper().insertExercise({
      'name': 'تمرين جديد',
      'description': 'وصف التمرين هنا',
      'videoUrl': 'https://www.youtube.com/', // ضع رابط فيديو حقيقي لو حابب
    });
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

  void _showDetails(Map<String, dynamic> exercise) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(exercise['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(exercise['description']),
            SizedBox(height: 10),
            if (exercise['videoUrl'] != null && exercise['videoUrl'] != '')
              ElevatedButton.icon(
                icon: Icon(Icons.play_arrow),
                label: Text('تشغيل الفيديو'),
                onPressed: () async {
                  final url = exercise['videoUrl'];
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إغلاق'),
          ),
          TextButton(
            onPressed: () {
              _deleteExercise(exercise['id']);
              Navigator.pop(context);
            },
            child: Text('حذف'),
          ),
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
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addDummyExercise,
          ),
          IconButton(
            icon: Icon(Icons.delete_sweep),
            onPressed: _deleteAllExercises,
          ),
        ],
      ),
      body: _exercises.isEmpty
          ? Center(child: Text('لا يوجد تمارين بعد'))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: _exercises.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final exercise = _exercises[index];
                  return GestureDetector(
                    onTap: () => _showDetails(exercise),
                    child: Card(
                      color: Colors.blueAccent,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            exercise['name'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
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
