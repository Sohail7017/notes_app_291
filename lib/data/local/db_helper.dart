import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  DbHelper._();

  static DbHelper getInstance() => DbHelper._();

  Database? myDB;

 Future<Database> getDb() async{
      myDB ??= await openDB();
      return myDB!;
  }
   Future<Database>   openDB()async{
    Directory appDirectory =await getApplicationDocumentsDirectory();
    String rootPath = appDirectory.path;

    String dbPath = join(rootPath, "notes.db");

    return await openDatabase(dbPath, version: 1, onCreate: (db, version){

      db.rawQuery("Create table notesData ( s_no integer primary key autoincrement, tittle text , desc text)");
    });

  }
}