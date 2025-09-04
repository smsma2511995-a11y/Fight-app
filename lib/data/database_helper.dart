import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/exercise.dart';
import 'all_exercises.dart';

class DatabaseHelper {
  // Singleton
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();
  static DatabaseHelper get instance => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'exercises.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE exercises (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,
            videoUrl TEXT,
            image TEXT,
            imageUrl TEXT,
            gif TEXT,
            gifUrl TEXT,
            imagePath TEXT,
            category TEXT,
            duration TEXT,
            durationSeconds INTEGER,
            calories INTEGER,
            type TEXT,
            value TEXT
          )
        ''');
      },
    );
  }

  // Seed DB if empty (called from main)
  Future<void> seedIfEmpty() async {
    final cnt = await getExerciseCount();
    if (cnt > 0) return;
    final db = await database;
    final batch = db.batch();
    for (final ex in allExercisesList) {
      batch.insert('exercises', ex.toMap());
    }
    await batch.commit(noResult: true);
  }

  // Backwards-compatible API names
  Future<List<Exercise>> getExercises() => getAllExercises();
  Future<List<Exercise>> getAllExercises() async {
    final db = await database;
    final res = await db.query('exercises', orderBy: 'id DESC');
    return res.map((r) => Exercise.fromMap(r)).toList();
  }

  Future<int> insertExercise(Exercise exercise) async {
    final db = await database;
    return await db.insert('exercises', exercise.toMap());
  }

  Future<int> deleteExercise(int id) async {
    final db = await database;
    return await db.delete('exercises', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete('exercises');
  }

  Future<int> getExerciseCount() async {
    final db = await database;
    final x = await db.rawQuery('SELECT COUNT(*) as count FROM exercises');
    return Sqflite.firstIntValue(x) ?? 0;
  }
}
