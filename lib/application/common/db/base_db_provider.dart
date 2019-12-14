import 'dart:async';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trs_abf/application/common/db/sql_manager.dart';

///基类
abstract class BaseDbProvider {
  bool isTableExits = false;

  createTableSqlString();

  tableName();

  Future<Database> getDataBase() async {
    return await open();
  }

  @mustCallSuper
  prepare(name, String createSql) async {
    isTableExits = await SqlManager.isTableExits(name);
    if (!isTableExits) {
      Database db = await SqlManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  @mustCallSuper
  open() async {
    if (!isTableExits) {
      await prepare(tableName(), createTableSqlString());
    }
    return await SqlManager.getCurrentDatabase();
  }
}








