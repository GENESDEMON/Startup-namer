import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:startup_namer/core/model/words_model.dart';
import 'package:startup_namer/utils/constants.dart';

class DBProvider{
  //creating a private constructor to be used only in the class
  DBProvider._();

  //initializing a static instance of the DBProvider
  static final DBProvider db = DBProvider._();

  //setting up the Database
  static Database _database;

  Future<Database> get database async {
    if (_database!=null) {
      return _database;
    }

    //if no database, instantiate database
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "RandomWords.db");
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE SavedWords (id INTEGER PRIMARY KEY, words TEXT)');
    });
  }

  newWords(Words words) async {
    final db = await database;
    var res = await db.insert(TABLENAME, words.toMap());
    return res;
  }

  Future<List<Words>>getWords() async {
    final db = await database;
    var res = await db.query(TABLENAME);
    List<Words> list = res.isNotEmpty ? res.map((e) => Words.fromMap(e)).toList() : [];
    return list;
  }


  deleteWords(int id) async {
    final db = await database;
    db.delete(TABLENAME, where: "id = ?", whereArgs: [id]);
  }
}
