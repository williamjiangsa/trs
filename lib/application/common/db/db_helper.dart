import 'package:sqflite/sqflite.dart';
import 'package:trs_abf/application/common/db/base_db_provider.dart';
import 'package:trs_abf/application/common/db/provier/invoice_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_child_item_provider.dart';
import 'package:trs_abf/application/common/db/sql_manager.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';

Future<List<Map<String, dynamic>>> getInvoiceItem() async {
  Database db = await SqlManager.getCurrentDatabase();
  db.transaction((txn) async {});
  var invoiceProvider = InvoiceProvider();
  return db.rawQuery(
      'SELECT * FROM ${invoiceProvider.tabName} a LEFT JOIN ${TravelChildItemProvider().tabName} b on a.id=b.${TravelChildItemProvider.invoiceId}');
}

Future insertInvoiceItem(invoiceMap, List invoiceItemList, String date,
    String invoiceNumber, int invoiceChildItemId) async {
  var invoiceProvider = InvoiceProvider();
  var travelChildItemProvider = TravelChildItemProvider();
  Database db = await SqlManager.getCurrentDatabase();
  return await db.transaction((txn) async {
    var list = await txn.query(invoiceProvider.tabName,
        where: "${InvoiceProvider.abnNumber} = ?",
        whereArgs: [invoiceMap['${InvoiceProvider.abnNumber}']]);
    var invoiceId;
    //如果有重复的abn 则不继续在abn表添加
    if (ObjectUtil.isEmptyList(list)) {
      invoiceId = await txn.insert(invoiceProvider.tabName, invoiceMap);
    } else {
      invoiceId = list[0]['id'];
    }

    if (invoiceChildItemId != null) {
      //先删除之前的数据
      await txn.delete(travelChildItemProvider.tabName,
          where: "id = ?", whereArgs: [invoiceChildItemId]);
    }
    //新增
    await txn.insert(travelChildItemProvider.tabName, {
      TravelChildItemProvider.invoiceId: invoiceId,
      TravelChildItemProvider.invoiceNumber: invoiceNumber,
      TravelChildItemProvider.date: date,
      TravelChildItemProvider.childItemJson:
          JsonEncoder().convert(invoiceItemList)
    });
  });
}

initDb() {
  InvoiceProvider().init();
  TravelChildItemProvider().init();
}
