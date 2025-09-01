import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/exercise_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'fight_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE completed_exercises (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            exercise_id INTEGER,
            calories INTEGER,
            timestamp TEXT
          )
        ''');
      },
    );
  }

  Future<void> logExercise(MartialArtsExercise exercise) async {
    final db = await database;
    await db.insert(
      'completed_exercises',
      {
        'exercise_id': exercise.id,
        'calories': exercise.calories,
        'timestamp': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> getTotalCompletedExercises() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM completed_exercises');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> getTotalCaloriesBurned() async {
    final db = await database;
    final result = await db.rawQuery('SELECT SUM(calories) FROM completed_exercises');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}
