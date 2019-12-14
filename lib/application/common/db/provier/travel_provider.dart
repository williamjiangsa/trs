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

class TravelProvider extends BaseDbProvider {
  String _tabName = 'travel';

  String _id = 'id';

  static String selectCountry = 'country';
  static String selectLeaveData = 'leaveData';
  static String number = 'number';
  static String isLocalPerson = 'isLocalPerson';

  @override
  createTableSqlString() {
    // TODO: implement createTableSqlString
    return 'CREATE TABLE $_tabName ($_id INTEGER PRIMARY KEY, '
        '$selectCountry TEXT, '
        '$selectLeaveData TEXT, '
        '$isLocalPerson INTEGER, '
        '$number TEXT )';
  }

  ///插入到数据库
  Future insert(Map<String, dynamic> map) async {
    Database db = await getDataBase();
    var provider = await _getProvider(db);
    if (provider > 0) {
      await delete();
    }
    return await db.insert(_tabName, map);
  }

  Future _getProvider(Database db) async {
    List<Map<String, dynamic>> maps = await db.query(_tabName);
    return maps.length;
  }

  Future<List<Map<String, dynamic>>> query() async {
    Database db = await getDataBase();
    return await db.query(_tabName);
  }

  Future delete() async {
    Database db = await getDataBase();
    await db.delete(_tabName);
  }

  @override
  tableName() {
    // TODO: implement tableName
    return _tabName;
  }
}
