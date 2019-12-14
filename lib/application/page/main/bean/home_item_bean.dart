/*
 * 项目名:    trs_abf
 * 包名       application.page.main.bean
 * 文件名:    homeItemBean
 * 创建时间:  2019/5/7 on 3:13 PM
 * 描述:     TODO
 *
 * @author   YHF
 */

class HomeItemBean {
  String title;

  HomeItemBean(this.title, this.childItemList);

  List<HomeChildItem> childItemList;
}

class HomeChildItem {
  String title;

  HomeChildItem(this.title, this.action, this.isFinish);

  dynamic action;
  bool isFinish;
}
