import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  /// Singleton
/// Private Constructor
  DbHelper._();

  static DbHelper getInstance() => DbHelper._();
  static final String tableName = "notesData";
  static final String tableColumnSNo = "sno";
  static final String tableColumnTittle = "tittle";
  static final String tableColumnDesc = "desc";
/// Global Database
  Database? myDB;

  /// Get database
 Future<Database> getDb() async{
      myDB ??= await openDB();
      return myDB!;
  }

    /// Open Database
   Future<Database>   openDB()async{
    Directory appDirectory =await getApplicationDocumentsDirectory();
    String rootPath = appDirectory.path;

    String dbPath = join(rootPath, "notes.db");

    return await openDatabase(dbPath, version: 1, onCreate: (db, version){

      db.rawQuery("Create table $tableName ( $tableColumnSNo integer primary key autoincrement, $tableColumnTittle text , $tableColumnDesc text)");
    });

  }

  /// Queries
/// Insert data

Future<bool>  addNotes({required String tittle, required String desc}) async{
   var db = await getDb();
  int rowsEffected = await db.insert(tableName, {
     tableColumnTittle: tittle,
     tableColumnDesc: desc,
   });
  return rowsEffected>0;
}
    /// Get all data
  Future<List<Map<String,dynamic>>> getAllData()async{
   var db = await getDb();

   var allNotes = await db.query(tableName);

   return allNotes;
  }

  /// Update Note

   Future<bool> updateNote({required String tittle, required String desc, required int sno}) async{
   var db =  await getDb();

   int rowsEffected = await db.update(tableName, {tableColumnTittle: tittle, tableColumnDesc: desc, tableColumnSNo: sno},
   where: "$tableColumnSNo = $sno"
   );
    return rowsEffected>0;
   }

   /// Delete Note
    Future<bool> deleteNote({required int sno}) async{
      var db =  await getDb();

     int rowsEffected = await db.delete(tableName, where: "$tableColumnSNo = ?", whereArgs: ['$sno']);
      return rowsEffected>0;
    }
}