import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: Scaffold(
      appBar: AppBar(
        title: Text('flutter layout demo'),
      ),
      body: TabBarDemo(),
    ),
  ));
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo() : super();

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
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          leading: Icon(Icons.home),
          backgroundColor: Colors.amber[1000],
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: <Widget>[
              Tab(text: 'tabs 1'),
              Tab(text: 'tabs 2'),
              Tab(text: 'tabs 3'),
            ],
          ),
        ),
        body: TabBarView(controller: _tabController, children: <Widget>[
          Text('TabsView1'),
          Text('TabsView2'),
          Text('TabsView3'),
        ]),
      ),
    );
  }
}
