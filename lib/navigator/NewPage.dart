import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'NewPage.g.dart';

@JsonSerializable()
class User {
  User(this.name, this.email);

  String name;
  String email;
  //不同的类使用不同的mixin即可
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  var resData;
  // onPressed() {
  //   // Navigator.pushNamed(context, NewPage);
  //   Navigator.push(
  //       context, new MaterialPageRoute(builder: (context) => new NewPage()));
  // }
  @override
  void initState() {
    super.initState();
    _getHttp();
  }

  void _getHttp() async {
    Response response;
    String url = 'http://fundapi.jixhui.com/article/list';
    var params = {'page': 1, 'size': 5};
    Dio dio = new Dio();
    // dio.interceptors.add(LogInterceptor(responseBody: true));
    try {
      response = await dio.post(url, data: FormData.fromMap(params));
      setState(() {
        resData = json.encode(response);
      });
      print(resData);
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter layout demo'),
        ),
        body: Container(
          // child: FlatButton(
          //   onPressed: _getHttp,
          child: Text('data00'),
          // ),
        ),
      ),
    );
  }
}
