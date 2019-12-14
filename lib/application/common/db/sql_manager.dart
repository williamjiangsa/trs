import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';


class SqlManager {
  static const _VERSION = 1;

  static const _NAME = "zx.db";

  static Database _database;

  ///初始化
  static init() async {
    // open the database
    var databasesPath = await getDatabasesPath();
    String dbName = _NAME;
    String path = databasesPath + dbName;
    if (Platform.isIOS) {
      path = databasesPath + "/" + dbName;
    }
    _database = await openDatabase(path, version: _VERSION, onCreate: (Database db, int version) async {
    });
  }


  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _database.rawQuery("select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  ///获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await init();
    }
    return _database;
  }

  ///关闭
  static close() {
      _database?.close();
      _database = null;
  }
}
