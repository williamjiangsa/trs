import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'package:trs_abf/framework/base.dart';

class ReturnInvoicePage extends StatefulWidget {
  @override
  _ReturnInvoicePageState createState() => _ReturnInvoicePageState();
}

class _ReturnInvoicePageState extends State<ReturnInvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultToolBar(
        title: '信息',
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Text(
            '符合下列条件的商品可退税\n ●您在离开澳大利亚前60天内购买的商品;且\n ●您在任何一个零售商家消费最少300澳元(含GST);且\n ●您本人付款购买商品;且\n ●您有商品的税务发票原件;且\n ●您离开澳大利亚时穿戴在身上或作为手提行李携带商品(除非是液体类、胶状类或喷雾类商品)登机或登船,或者在澳大利亚边境检察署客户服务台的官员查看了这些商品之后办理托运。\n \n 以下条件不符合退税资格\n ●啤酒、烈烈酒或烟草产品;或\n ●免 GST/WET的商品(如药品、某些食品);或\n ●服务(如住宿、租车、食品、旅游担保等服务);或\n ●礼品卡或消费券;或\n ●在澳大利亚已经消费或部分消费的商品(如食品、香水等)。可以使用照相机、 iphone、服装等;或\n ●不随你登机或登船离开澳大利亚的商品。\n 检查您的税务发票;有些税务发票会注明每件商品是否已征收GST或WET。',
            style: TextStyle(color: defaultBlackTextColor)),
      ),
    );
  }
}
