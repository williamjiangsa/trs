
import 'package:flutter/material.dart';

//点击返回回调方法
typedef OnBackPress = void Function();

// ignore: must_be_immutable
class DefaultToolBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget rightWidget;
  final OnBackPress onBackPress;
  final bool showBackButton;
  final double titleSpace;
  final Widget titleWidget;
  final Widget leftWidget;

  DefaultToolBar({
    Key key,
    this.title = "",
    this.rightWidget,
    this.onBackPress,
    this.showBackButton = true,
    this.titleSpace = 0, this.titleWidget, this.leftWidget,
  }) : super(key: key);

  @override
  DefaultToolBarState createState() => new DefaultToolBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class DefaultToolBarState extends State<DefaultToolBar> {
  @override
  Widget build(BuildContext context) {
    bool canPop = ModalRoute.of(context)?.canPop ?? false;
    double titleLeftSpace = widget.titleSpace;
    double titleRightSpace = kToolbarHeight + widget.titleSpace;
    double titleWidth = MediaQuery.of(context).size.width -
        (kToolbarHeight + widget.titleSpace) * 2;
    return new Scaffold(
      appBar: new AppBar(
        titleSpacing: 0,
        flexibleSpace: Row(
          children: <Widget>[
            Container(
              width: kToolbarHeight,
              height: 10,
            ),
          ],
        ),
        leading: widget.showBackButton && canPop
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 18,
                ),
                onPressed: () {
                  widget.onBackPress == null
                      ? Navigator.maybePop(context)
                      : widget.onBackPress();
                },
              )
            : widget.leftWidget==null?Container(
          width: 0,
          height: 0,
        ):widget.leftWidget,
        actions: <Widget>[],
        elevation: 0,
        title: Container(
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: titleWidth,
                    margin: EdgeInsets.only(
                      left: titleLeftSpace,
                      right: titleRightSpace,
                    ),
                    child: Center(
                      child: widget.titleWidget == null
                          ? Text(
                              widget.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )
                          : widget.titleWidget,
                    ),
                  ),
                ],
              ),
              new Positioned(
                right: 0.0,
                top: 0.0,
                child: widget.rightWidget != null
                    ? widget.rightWidget
                    : Container(
                        width: 0,
                        height: 0,
                      ),
              ),
            ],
          ),
//            Row(
//            children: <Widget>[
//              Expanded(
//                flex: widget.title.length <= 0 ? 0 : 7,
//                child: Padding(
//                  padding: EdgeInsets.only(right: 0),
//                  child: Center(
//                    child: Text(
//                      widget.title,
//                      style: TextStyle(
//                        fontSize: sFontSize(16),
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//              Expanded(
//                child: widget.rightWidget != null
//                    ? widget.rightWidget
//                    : Container(
//                  width: 0,
//                  height: 0,
//                ),
//              ),
//            ],
//          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(DefaultToolBar oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
