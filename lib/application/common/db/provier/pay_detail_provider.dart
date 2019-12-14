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

class PayDetailProvider extends BaseDbProvider {
  String _tabName = 'pay_detail';

  String _id = 'id';

  static String lastName = 'lastName';
  static String name = 'name';
  static String country = 'country';
  static String addressLineOne = 'addressLineOne';
  static String addressLineTwo = 'addressLineTwo';
  static String city = 'city';
  static String pro = 'pro';
  static String zipCode = 'zipCode';
  static String channel = 'channel';
  static String currency = 'currency';
  static String account = 'account';
  static String accountName = 'accountName';
  static String bsbNumber = 'bsbNumber';

  @override
  createTableSqlString() {
    // TODO: implement createTableSqlString
    return 'CREATE TABLE $_tabName ($_id INTEGER PRIMARY KEY, '
        '$channel TEXT, '
        '$lastName TEXT, '
        '$name TEXT, '
        '$country TEXT, '
        '$addressLineOne TEXT, '
        '$addressLineTwo TEXT, '
        '$city TEXT, '
        '$pro TEXT, '
        '$currency TEXT, '
        '$account TEXT, '
        '$accountName TEXT, '
        '$bsbNumber TEXT, '
        '$zipCode TEXT )';
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

  Future update(Map<String, dynamic> map) async {
    Database db = await getDataBase();
    return await db.update(_tabName, map);
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await getDataBase();
    return await db.query(_tabName);
  }

  Future _getProvider(Database db) async {
    List<Map<String, dynamic>> maps = await db.query(_tabName);
    return maps.length;
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
