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

///发票项目表
class TravelChildItemProvider extends BaseDbProvider {
  String _tabName = 'travelChild';

  String get tabName => _tabName;
  String _id = 'id';

  ///发票id
  static String invoiceId = 'invoiceId';
  ///项目类型
  static String goodsType = 'goodsType';
  ///项目金额
  static String money = 'money';

  static String invoiceNumber = 'invoiceNumber';
  static String date = 'date';

  static String childItemJson='childItemJson';

  @override
  createTableSqlString() {
    // TODO: implement createTableSqlString
    return 'CREATE TABLE $_tabName ($_id INTEGER PRIMARY KEY, '
        '$invoiceId INTEGER, '
        '$invoiceNumber TEXT, '
        '$date TEXT, '
        '$childItemJson TEXT )';
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

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await getDataBase();
    return await db.query(_tabName);
  }

  Future _getProvider(Database db) async {
    List<Map<String, dynamic>> maps = await db.query(_tabName);
    return maps.length;
  }

  Future<List<Map<String, dynamic>>> query() async {
    Database db = await getDataBase();
    return await db.query(_tabName);
  }

  Future delete({id}) async {
    Database db = await getDataBase();
    if(id!=null){
      return  await db.delete(_tabName, where: "$_id = ?", whereArgs: [id]);
    }else{
      await db.delete(_tabName);
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
