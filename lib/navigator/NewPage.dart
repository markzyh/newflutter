import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class NewPage extends StatelessWidget {
  // onPressed() {
  //   // Navigator.pushNamed(context, NewPage);
  //   Navigator.push(
  //       context, new MaterialPageRoute(builder: (context) => new NewPage()));
  // }
  FormData formData = FormData.fromMap({
    "page": 1,
    "size": 5,
  });
  void _getHttp() async {
    Response response;
    String url = 'http://fundapi.jixhui.com/article/list';
    // String url = 'http://fundapi.jixhui.com/banner/list';
    Map params = {'page': 1, 'size': 5};
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    try {
      response = await dio.post(url, data: formData);
      print(params);
      print(response);
    } catch (e) {
      print(e);
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
          child: FlatButton(
            onPressed: _getHttp,
            child: Text('data00'),
          ),
        ),
      ),
    );
  }
}
