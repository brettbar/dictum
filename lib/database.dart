import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'models/note.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();  
  Database? _database;  

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await createDatabase();
    return _database!;
  }  

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "dictum.db");    
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }  

  void initDB(Database database, int version) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS notes (
        id INTEGER PRIMARY KEY NOT NULL,
        title TEXT,
        text TEXT,
        color INTEGER,
        date_created INTEGER,
        date_last_edited INTEGER
      )
      """);
  }

  Future<int> insertNote(Note note) async {
    final db = await database;

    await db.insert(
      'notes',
      note.toMap(false),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    var one = await db.query(
      "notes", 
      orderBy: "date_last_edited desc",
      limit: 1
    );
    int latestId = one.first["id"] as int;

    return latestId;
  }

  Future<List<Map<String,dynamic>>> notes() async {
    final db = await database; 
    return await db.query('notes');
  }

  Future<void> updateNote(Note note) async {
    final db = await database;

    await db.update(
      'notes',
      note.toMap(true),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(int id) async {
    final db = await database;

    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
