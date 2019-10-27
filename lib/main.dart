import 'package:flutter/material.dart';

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
          controller: _tabController,
          children: <Widget>[
            Text('PageView111'),
            Text('PageView222'),
            Text('PageView333'),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.grey,
          child: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              FlatButton(child: Text('button1')),
              FlatButton(child: Text('button2')),
              FlatButton(child: Text('button3')),
            ],
            indicatorColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
