import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'models/note.dart';

final todoTABLE = 'Todo';
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
        await database.execute("CREATE TABLE $todoTABLE ("
            "id INTEGER PRIMARY KEY, "
            "description TEXT, "
            "is_done INTEGER "
            ")");
    }

    Future<void> insertNote(Note note) async {
        final db = await database;
        await db.insert(
            'notes',
            note.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
        );
    }

    Future<List<Note>> notes() async {
        final db = await database; 
        
        final List<Map<String, dynamic>> maps = await db.query('notes');

        return List.generate(maps.length, (i) {
            return Note(
                id: maps[i]['id'],
                title: maps[i]['title'],
                text: maps[i]['text'],
                color: maps[i]['color'],
                creationTime: maps[i]['creationTime'],
            );
        });
    }

    Future<void> updateNote(Note note) async {
        final db = await database;

        await db.update(
            'notes',
            note.toMap(),
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
