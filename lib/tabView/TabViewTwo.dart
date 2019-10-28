import 'package:flutter/material.dart';

class TabViewTwo extends StatefulWidget {
  @override
  _TabViewTwo createState() => _TabViewTwo();
}

class _TabViewTwo extends State<TabViewTwo> {
  @override
  void initState() {
    super.initState();
    print('TabViewTwo init');
  }

  @override
  Widget build(BuildContext context) {
    return Text('TabViewTwo');
  }
}
