import 'package:firebase_database/firebase_database.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class DatabaseHelper {
  static final _dbName='foodwagon.db';
  static final _dbVersion = 1;
  static DatabaseHelper _databaseHelper;
  static Database _database;
  static final _tableName='user_table';
  static final interests="interests";
  static final myJobs="myJobs";
  static final aboutMe="aboutMe";
  static final workExp="workExp";
  static final schoolName="schoolName";
  static final collegeName="collegeName";
  static final colId="col_id";
  static final colUserType='user_type';
  static final colSeekerType='seeker_type';
  static final colEnglish='english';
  static final colEducation='education';
  static final colGender='gender';
/*
  DatabaseHelper._createInstance();
  factory DatabaseHelper(){
    if(_databaseHelper==null){
    _databaseHelper= DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }*/
  DatabaseHelper._privateConstructor();
static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async{
    if(_database==null){
      _database=await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path ,_dbName);

    var userDatabase= await openDatabase(path,version: 1,onCreate: _createDb);
    return userDatabase;
  }

  void _createDb(Database db,int newVersion) async {
    await db.execute('CREATE TABLE $_tableName($colId INTEGER PRIMARY KEY,$colUserType TEXT,$colSeekerType text,$colEducation text,$colEnglish text,$colGender text)');
  }

  //fetch
  Future<List<Map<String,dynamic>>>getMapList() async{
    Database db = await instance.database;
    var result = await db.query(_tableName);
    return result;
  }

  //insert
Future<int> insert(Map<String,dynamic> row) async{
  Database db = await instance.database;
  return await db.insert(_tableName, row); //this will return primary key
}

//update
Future update(Map<String,dynamic> row)async{
  Database db = await instance.database;
  int id = row[colId];
  return await db.update(_tableName, row,where: '$colId=?',whereArgs: [id]);
}

//delete
Future<int> delete(int id)async{
    Database db=await instance.database;
    return await db.delete(_tableName,where: '$colId=?',whereArgs: [id]);

}
}
