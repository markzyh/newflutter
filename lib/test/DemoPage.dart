import 'package:flutter/material.dart';
import 'package:newflutter/test/DemoItem.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter layout demo'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return DemoItem();
          },
          itemCount: 8,
        ),
      ),
    );
  }
}
