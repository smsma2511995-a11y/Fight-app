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
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'fight_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE exercises(
            id INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT,
            category TEXT,
            calories INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE progress(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            exerciseId INTEGER,
            completedAt TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertExercise(MartialArtsExercise exercise) async {
    final db = await database;
    return await db.insert('exercises', exercise.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MartialArtsExercise>> getAllExercises() async {
    final db = await database;
    final maps = await db.query('exercises');
    return maps.map((e) => MartialArtsExercise.fromMap(e)).toList();
  }

  Future<void> logExercise(int exerciseId) async {
    final db = await database;
    await db.insert('progress', {
      'exerciseId': exerciseId,
      'completedAt': DateTime.now().toIso8601String(),
    });
  }

  Future<int> getTotalCompletedExercises() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM progress');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> getTotalCaloriesBurned() async {
    final db = await database;
    final result = await db.rawQuery('''
      SELECT SUM(e.calories)
      FROM progress p
      INNER JOIN exercises e ON p.exerciseId = e.id
    ''');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}
