import 'package:flutter/material.dart';

class TabViewOne extends StatefulWidget {
  @override
  _TabViewOne createState() => _TabViewOne();
}

class _TabViewOne extends State<TabViewOne> with AutomaticKeepAliveClientMixin {
  String text = 'TabViewOne';
  @override
  void initState() {
    super.initState();
    print('TabViewOne init');
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        text = '我已经改变了';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text('$text');
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
