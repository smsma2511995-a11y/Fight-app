import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/exercise.dart';

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
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE exercises(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          description TEXT,
          videoUrl TEXT
        )
      ''');
    });
  }

  Future<List<Exercise>> getExercises() async {
    final db = await database;
    final res = await db.query('exercises', orderBy: 'id DESC');
    return res.map((e) => Exercise.fromMap(e)).toList();
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
