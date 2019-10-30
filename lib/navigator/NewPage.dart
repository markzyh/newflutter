import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'NewPage.g.dart';

@JsonSerializable()
class ActicleLIstData {
  String title, author;

  ActicleLIstData(
    this.title,
    this.author,
  );
  //不同的类使用不同的mixin即可
  factory ActicleLIstData.fromJson(Map<String, dynamic> json) =>
      _$ActicleLIstDataFromJson(json);
  Map<String, dynamic> toJson() => _$ActicleLIstDataToJson(this);
}

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List dataList = [];
  final ScrollController _scrollController = ScrollController();
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  var resData;
  @override
  void initState() {
    super.initState();
    print('开始了开始了开始了开始了');
    _getHttp();
  }

  void _getHttp() async {
    Response response;
    var res;
    String url = 'http://fundapi.jixhui.com/article/list';
    var params = {'page': 1, 'size': 5};
    Dio dio = new Dio();
    try {
      response = await dio.post(url, data: FormData.fromMap(params));
      res = json.decode(response.toString());
      resData = res['data'];
      List items = [];
      resData.forEach((item) {
        items.add(ActicleLIstData(
          item['title'],
          item['author'],
        ));
      });
      setState(() {
        dataList = items;
      });
    } catch (e) {
      print(e);
      print('错误出现异常');
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
          child: ListView.separated(
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              ActicleLIstData getData = dataList[index];
              return Text('${getData.title}');
            },
            itemCount: dataList.length,
            controller: _scrollController,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
