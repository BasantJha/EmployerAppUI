import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'Userdetails.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
//import 'package:flutter/foundation.dart' show kIsWeb;

class DatabaseHelper{
  static final _databaseName = "userdetail.db";
  static final _databaseVersion = 1;
  static final table = 'user_table';
  static final columnId = 'id';
  static final columnemail = 'email';
  static final columnName = 'name';
  static final columnaddress = 'address';
  static final columncontact = 'contacts';
  String? path;
// static Future<List<Map<String,dynamic>>> data = [] as Future<List<Map<String, dynamic>>>;

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }
  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory directory;
    if (kIsWeb) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    String path =join(directory.path,_databaseName);
    print(path);
    return  await openDatabase(path,version: _databaseVersion,onCreate: _onCreate);
  }
  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnemail TEXT NOT NULL,
            $columnName TEXT NOT NULL,
            $columnaddress TEXT NOT NULL,
            $columncontact INTEGER NOT NULL
          )
          ''');
  }
  Future<int> insert(User user) async {
    Database? db = await instance.database;
    print(path);
    print("Email Entered :${user.email}");
    int contact = user.contact??0;
    if(contact == null){
      return await db!.insert(table, {'email': user.email,'name':user.name,'address':user.address, 'contacts': "1234"});
    }else{
      return await db!.insert(table, {'email': user.email,'name':user.name,'address':user.address, 'contacts': contact});
    }
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  // Queries rows based on the argument received
  Future<List<Map<String, dynamic>>> queryRows(name) async {
    Database? db = await instance.database;
    return await db!.query(table, where: "$columnName LIKE '%$name%'");
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(User user) async {
    Database? db = await instance.database;
    int id = user.toMap()['id'];
    return await db!.update(table, user.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}

