import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/exercise_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _db;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB('exercises.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

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
            cachedPath TEXT
          )
        ''');
      },
    );
  }

  Future<List<Exercise>> getExercises() async {
    final db = await database;
    final result = await db.query('exercises');
    return result.map((e) => Exercise.fromMap(e)).toList();
  }

  Future<int> insertExercise(Exercise ex) async {
    final db = await database;
    return await db.insert('exercises', ex.toMap());
  }

  Future<void> clear() async {
    final db = await database;
    await db.delete('exercises');
  }
}
