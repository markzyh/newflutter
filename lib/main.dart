import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: Scaffold(
      appBar: AppBar(
        title: Text('flutter layout demo'),
      ),
      body: PullLoadWidget(),
    ),
  ));
}

class PullLoadWidget extends StatefulWidget {
  @override
  _PullLoadWidget createState() => _PullLoadWidget();
}

class _PullLoadWidget extends State<PullLoadWidget> {
  final ScrollController _scrollController = ScrollController();
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  int _itemCount = 50;
  bool _isLoadingMore = false;

  //上拉刷新
  @protected
  Future<Null> onRefresh() async {
    print('刷新了刷新了111');
  }

  @override
  void initState() {
    super.initState();
    //增加滑动监听
    _scrollController.addListener(() {
      //判断是否滑动到底部，触发加载更多回调
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //加载更多
        print('加载更多');
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            _itemCount += 10;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: onRefresh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return DemoItem('$index');
                },
                itemCount: _itemCount,
                controller: _scrollController,
              ),
            ],
          ),
          Text('加载更多')
        ],
      ),
    );
    // return MaterialApp(
    //   title: 'Shopping App',
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('flutter layout demo'),
    //     ),
    //     body: ListView.builder(
    //       itemBuilder: (context, index) {
    //         return DemoItem();
    //       },
    //       itemCount: 50,
    //     ),
    //   ),
    // );
  }
}

class DemoItem extends StatelessWidget {
  final String text;

  const DemoItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$text'),
    );
  }
}
