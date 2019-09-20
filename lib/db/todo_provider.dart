import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../model/todo.dart';

class TodoProvider {
  Database dbase;

  Future<Database> get database async {
    if (dbase != null) return dbase;

    // if _database is null we instantiate it
    dbase = await init();
    return dbase;
  }

//INITIALZING THE DATABASE
  init() async {
    //create a db connection
    Directory dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, "storage.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database newdb, int version) async {
        //create database table
        await newdb.execute('''
      CREATE TABLE storage 
      (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL, 
          details TEXT NOT NULL,
          categories TEXT NOT NULL
          datetime TEXT NOT NULL
      )
      ''');
      },
    );
  }

  //insert values
  Future<Todo> insert(Todo todo) async {
    print(todo.toMap());
    //conflict replace the same value been inserted into the database
    final db = await database;
    print(db);
    todo.id = await db.insert("storage", todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return todo;
  }

  //retrieve / fetch some values
  //note: it is a backward system
  /*
    * ^
    * | columns
    * | where
    * | whereargs
    * | String category
    * */
  fetchlist(int id) async {
    final db = await database;
    var response = await db.query(
      "storage",
      columns: ["id","title", "details", "categories","datetime"],
      where: "id = ?",
      whereArgs: [id],
    );
    List<Todo> list = response.map((c) => Todo.fromMap(c)).toList();
    return list;
  }

  //fetch all values
  Future<List<Todo>> fetchall() async {
    final db = await database;
    var response = await db.query(
      "storage",
      columns: ["id","title", "details", "categories","datetime"],
      orderBy: "id DESC"
    );

    List<Todo> list = response.map((c) => Todo.fromMap(c)).toList();

    return list;
  }

  //DELETE
  delete(int id) async {
    final db = await database;
    return  db.delete("storage", where: "id = ?", whereArgs: [id]);
  }

  //DELETE ALL
  Future deleteall() async {
    final db = await database;
    return await db.delete("storage");
  }

  //UPDATE
  Future<int> update(Todo todo) async {
    final db = await database;
    return await db
        .update("storage", todo.toMap(), where: "id = ?", whereArgs: [todo.id]);
  }
}
