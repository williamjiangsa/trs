/*
 * 项目名:    trs.abf
 * 包名
 * 文件名:    travel_provider
 * 创建时间:  2019/5/13 on 11:02 AM
 * 描述:     TODO
 *
 * @author   YHF
 */

import 'package:sqflite/sqflite.dart';

import '../base_db_provider.dart';

class InvoiceProvider extends BaseDbProvider {
  String _tabName = 'invoice';


  String get tabName => _tabName;

  String _id = 'id';

  static String abnNumber = 'abnNumber';

  @override
  createTableSqlString() {
    // TODO: implement createTableSqlString
    return 'CREATE TABLE $_tabName ($_id INTEGER PRIMARY KEY, '
        '$abnNumber TEXT )';
  }

  ///插入到数据库
  Future insert(Map<String, dynamic> map) async {
    Database db = await getDataBase();
    return await db.insert(_tabName, map);
  }

  Future update(Map<String, dynamic> map, String abn) async {
    Database db = await getDataBase();
    return await db
        .update(_tabName, map, where: "$abnNumber = ?", whereArgs: [abn]);
  }

  Future<List<Map<String, dynamic>>> select({String abn}) async {
    Database db = await getDataBase();
    if (abn != null) {
      return await db
          .query(_tabName, where: "$abnNumber = ?", whereArgs: [abn]);
    } else {
      return await db.query(_tabName);
    }
  }

  Future _getProvider(Database db) async {
    List<Map<String, dynamic>> maps = await db.query(_tabName);
    return maps.length;
  }

  Future delete({String abn}) async {
    Database db = await getDataBase();
    if (abn != null) {
      return await db
          .delete(_tabName, where: "$abnNumber = ?", whereArgs: [abn]);
    } else {
      return await db.delete(_tabName);
    }
  }

  @override
  tableName() {
    // TODO: implement tableName
    return _tabName;
  }

 Future init() async{
    await getDataBase();
  }
}
