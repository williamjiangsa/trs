import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'bean/info_item_bean.dart';
import 'state.dart';

Reducer<InfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<InfoState>>{
      InfoAction.action: _onAction,
      InfoAction.initInfoListData: _onInitInfoListDataAction,
    },
  );
}

InfoState _onAction(InfoState state, Action action) {
  final InfoState newState = state.clone();
  return newState;
}

InfoState _onInitInfoListDataAction(InfoState state, Action action) {
  print('111');
  final InfoState newState = state.clone();
  var data = newState.data;
  data.add(InfoItemBean('致所有申请人的重要提示', '您可以在本程序中输入进行游客退税计划(TRS)申请所需的信息。当您完成信息输入后，这些信息将存储在一个QR代码中，并保存在您的手机上。这个QR代码就是您的TRS申请代码。本程序只会保存您最后完成的TRS申请代码当您离开澳大利亚时，您必须向TRS办理台的官员出示您的TRS申请代码。有关本程序使用条件、TRS申请资格规定以及申请流程的详细信息，请阅读下面的TRS信息页警告：本程序生成的TRS申请代码未加密，任何可读取QR代码的设备均可读取。该代码及其数据的安全性由您全权负责。关于本程序您可以在本程序中输入进行游客退税计划(TRS)申请所需的信息。本程序会将这些信息保存在您的手机中，以便您分多次编辑申请。这些信息将存储在一个QR代码中，并保存在您的手机上。这个QR代码就是您的TRS申请代码。本程序只会保存您最后完成的TRS申请代码。当您离开澳大利亚时，您必须向TRS办理台的官员出示您的TRS申请代码。如果您使用本程序成功输入您的申请信息，当您离开澳大利亚时TRs办理台能够更快速地处理您的申请，而且您也许能够使用专门通道进行TRS申请。由于空间有限，申请代码只能容纳10张发票。如果您有不止10张发票，请将您的TRS申请代码保存在您的手机上，并出示剩余的税务发票进行人工处理如果您完成申请代码创建之后购买了其他商品，您可以出示您的申请代码及其他税务发票进行人工处理以下是有关本程序使用条件、TRS申请资格规定以及申请流程的详细信息。警告：本程序生成的TRS申请代码未加密，任何可读取QR代码的设备均可读取。该代码及其数据的安全性由您全权负责。'));

  data.add(InfoItemBean('我可以在哪里使用本程序？', '您只有从下列国际机场离开澳大利亚才能使用本程序\n \n ●阿德莱德机场\n ●布里斯班机场\n ●凯恩斯机场\n ●达尔文机场\n ●黄金海岸机场\n ●墨尔本机场\n ●珀斯机场\n ●阳光海岸(马卢奇郡)\n ●悉尼机场\n ●汤斯维尔\n 一些海港轮船码头退税办理处也将在2015年启用。\n 请访问澳大利亚移民和边境保护部网页有关游客退税计划内容查寻最新办理处位置。'));
  data.add(InfoItemBean('申请退税', '请确保您有至少90分钟时间完成登机、出入境和安检手续并进行TRS申请。在飞机预定离开前30分钟内将停止处理TRS申请。\n \n 您必须向TRS办理台的官员出示您的TRS申请代码以及任何其他税务发票。\n \n 同时，您必须准备好下列要向官员出示的物品：\n ●您的护照和国际登机牌；\n ●商品，或官员已查看您的商品的证据；以及\n ●您的税务发票原件。\n \n 我们的官员在处理TRS申请时，有权要求查看您的护照、登机牌、所有商品和/或税务发票。如果您无法按要求出示您的部分或所有商品和/或税务发票，或无法提供官员已查看您的商品的证据，您的部分或所有TRS申请将被拒绝。\n \n 注意：我们将优先处理TRS申请数据全部存储在申请代码中的旅客的TRS申请。'));
  data.add(InfoItemBean('什么是游客退税计划？', '游客退税计划(TRS)使您可以对在澳大利亚购买并且作为随身行李携带到海外的某些商品申请退回消费税(GST)和酒类均衡税(WET)。'));
  data.add(InfoItemBean('哪些商品符合退税条件?', 'TRS适用于所有海外游客和澳大利亚居民,但在职航空和航海人员没有资格申请TRS退税。\n 哪些商品符合退税条件\n 符合下列条件的商品可退税\n ●您在离开澳大利亚前60天内购买的商品;且\n ●您在任何一个零售商家消费最少300澳元(含GST);且\n ●您本人付款购买商品;且\n ●您有商品的税务发票原件;且\n ●您离开澳大利亚时穿戴在身上或作为手提行李携带商品(除非是液体类、胶状类或喷雾类商品)登机或登船,或者在澳大利亚边境检察署客户服务台的官员查看了这些商品之后办理托运。\n \n 以下条件不符合退税资格\n ●啤酒、烈烈酒或烟草产品;或\n ●免 GST/WET的商品(如药品、某些食品);或\n ●服务(如住宿、租车、食品、旅游担保等服务);或\n ●礼品卡或消费券;或\n ●在澳大利亚已经消费或部分消费的商品(如食品、香水等)。可以使用照相机、 iphone、服装等;或\n ●不随你登机或登船离开澳大利亚的商品。\n 检查您的税务发票;有些税务发票会注明每件商品是否已征收GST或WET。\n 我的退税金额是多少?\n 的退税金额是您所有符合退税条件的商品的GST和/或WET总额。\n GST退税金额的计算方式为将购买商品金额除以11\n WET退税金额则为酒类商品总价的14.5%信用卡或澳大利亚银行账户退税将在60天内到账。\n 退税支票最多两个月可寄达'));
  data.add(InfoItemBean('我需要带些什么去TRS办理台？', '带上您的商品、税务发票原件、护照及登机牌去TRS办理台。同时,您必须出示您的申请代码。\n税务发票包含以下内容:含" tax invoice"字样;零售商名称及其澳大利亚商业号码(ABN);商品的购买价格,包括支付的GST和/或WET;商品描述;以及购买日期。1,000澳元或以上的税务发票还必须显示您的姓名和地址。\n如果您无法按要求出示您的部分或所有商品和/或税务发票,或无法提供官员已查看您的商品的证据您的部分或所有申请将被拒绝。\n付于液体类、喷雾类、胶状类或尺寸过大商品的TRS申请,我们另有规定。详见下面的内容。'));
  data.add(InfoItemBean('我应该在离开澳大利亚前多长时间去TRS办理台?', '在飞机预定离开前30分钟内将停止处理申请。为了确保您有足够的时间进行TRS申请,您完成岀入境手续时距离您的航班预定离开时间应该至少还有90分钟。\n 您完成出入境手续之后,便可以去TRS办理台进行\n 申请。\n 在悉尼机场、墨尔本机场、布里斯班机场、珀斯机场、达尔文机场、阿德莱德机场、凯恩斯机场和库兰加塔机场等国际机场均设有TRS办理台。若要査找TRS办理台的位置,请访问您离开澳大利亚时将前往的机场的网站。'));
  data.add(InfoItemBean('如果我的商品是液体、喷雾或胶状或尺寸过大怎么办？', '澳大利亚对于出入境航班上可携带进入机舱的液体类、喷雾类或胶状类商品的份量有限制。请联系基础设施和交通部了解详情。\n 如果您想对您因这些限制而无法携带登机的液体类、喷雾类或胶状类商品进行TRS申请,请在办理这些商品的打包托运手续之前将它们带至客户服务台。\n 这同样适用于尺寸过大的商品,例如您必须托运的滑雪用具、滑雪板和高尔夫球杄等。\n 若要查找客户服务台的位置,请访问您离开澳大利亚时将前往的机场的网站。'));
  data.add(InfoItemBean('我申请过TRS退税的商品现在想带回澳大利亚。需要注意些什么?', '如果您年满18岁,您可以携带价值最高达900澳元的普通商品入境享受免税优惠;未满18岁的限额是450澳元。家庭成员一同出游可以累加各自的免税优惠(一对夫妻加一个孩子可免税携带入境澳大利亚的普通商品的总价值为:900澳元+900澳元+450澳元=2250澳元)。这就是您的旅客免税优惠。\n 普通商品包括礼品、纪念品、照相机、电子设备、皮革制品、香精、珠宝、手表和运动器械。\n 如果您携带的商品超过了您的旅客免税优惠限额包括您先前已申请TRS退税的商品在内：\n ●您必须申报所有这些商品;\n ●对于您申请过TRS退税的商品,您需要重新支付退税金额;\n ●您将面临的不仅仅是为超出您的旅客免税优惠限额的商品缴税,而是为所携带的所有该类商品缴税。\n 未申报超出免税优惠限额的商品将受到处罚。\n 隐私声明\n 我们将依据《新税制(消费税)法1999年版》(联邦法案)(ANew7 ax System( Goods and servicesax)Aet1999(cth).第168条规定,收集和使用您的个人信息,用来评估和退还消费税(GST和酒类均衡税(WET。为了评估和确定您的 GST/WET退税资格,我们可能会将这些信息提供给澳大利亚税务局( Australian taxation office)以及开出您已附发票的零售商。如果您应该收到退税付款,我们会将您的\n 我们会将您的个人信息提供给我们的签约商业代理\n 机构,以便办理退税。\n 未完成本申请或未提供这些信息将导致我们无法根\n 据本申请为您办理退税。\n 我们将依据《隐私法1988年版》(联邽法案)( Privacy Act1988(Cth)的明细表1中的澳大利亚\n 隐私保护准则( Australian Privacy Principles)的相关规定,收集、使用、存储和透露个人信息。\n 关于我们如何处理个人信息的更多详情,请查阅我们的隐私政策或致电1300363263咨询我们的隐私保护联络员。'));
  data.add(InfoItemBean('法律声明', '向官员提供虚假或误导性的陈述,包括出示虚假文\n 件,将受到处罚。\n 此TRS申请涉及的任何商品如被您带回澳大利亚,将被计入您的旅客可免税携带普通商品中。如果您的旅客可免税携带普通商品的总价值超出了免税优惠允许金额,您必须重新支付根据TRS退回的GST/WET以及基于您带入境的所有普通商品的总价值(而不仅仅是超出免税优惠限额的商品价值)的任何其他应付关税和税收。\n 未申报超出您的旅客免税优惠限额的入境商品也将受到处罚(见信息页中的“携带商品入境”)。'));
  data.add(InfoItemBean('联系游客退税办理处', '电话\n 澳大利亚境内-1300555043(按本地通话计\n 费)\n 澳大利亚境外-61262756666(仅澳大利亚\n 时间办公时间\n 网站\n TRS信息页\n 电子邮箱\n trs@border. gov.au\n 投诉与表扬\n ●电话\n 澳大利亚境内-1800228227(免费电话)\n 澳大利亚境外-61262756666\n ●电子邮箱\n comments@border gov.au\n 反馈\n 如果您对本程序有任何反馈,请联系游客退税办理处\n 电话\n 澳大利亚境内-1300555043(按本地通话计费\n 澳大利亚境外-61262756666(仅澳大利亚时间办公时间)\n 网站\n TRS信息页\n 电子邮箱\n trs@border.gov.au'));
  return newState;
}



