import 'package:flutter/material.dart';
import 'package:newflutter/tabView/TabViewOne.dart';
import 'package:newflutter/tabView/TabViewTwo.dart';
import 'package:newflutter/tabView/TabViewThree.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemo createState() => _TabBarDemo();
}

class _TabBarDemo extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  void initState() {
    print('调用一次调用一次');
    super.initState();
    _scrollViewController = ScrollController();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Demo'),
        ),
        body: TabBarView(
          children: <Widget>[
            TabViewOne(),
            TabViewTwo(),
            TabViewThree(),
          ],
          controller: _tabController,
        ),
        bottomNavigationBar: Material(
          child: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              FlatButton(child: Text('button1')),
              FlatButton(child: Text('button2')),
              FlatButton(child: Text('button3')),
            ],
          ),
        ),
      ),
    );
  }
}
