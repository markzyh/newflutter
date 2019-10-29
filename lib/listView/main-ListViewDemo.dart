import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        setState(() {
          _isLoadingMore = true;
        });
        _loadingMore();
        //加载更多
        print('加载更多');
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _itemCount += 5;
            _isLoadingMore = false;
          });
        });
      }
    });
  }

  _loadingMore() {
    return Row(children: <Widget>[
      SpinKitCircle(color: Colors.blue),
      Text(
        '正在加载更多。。。',
      ),
    ]);
  }

  // Widget _listViewChild() {
  //   return Expanded(
  //     child: ListView.builder(
  //       physics: BouncingScrollPhysics(),
  //       itemBuilder: (context, index) {
  //         return DemoItem('$index');
  //       },
  //       itemCount: _itemCount,
  //       controller: _scrollController,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var itemCount = _isLoadingMore ? _itemCount + 1 : _itemCount;
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: onRefresh,
      child: ListView.separated(
        // physics: BouncingScrollPhysics(),
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == _itemCount) {
            print('99999999999');
            return _loadingMore();
          }
          return DemoItem('$index');
        },
        itemCount: itemCount,
        controller: _scrollController,
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 1,
          color: Colors.blue,
        ),
      ),
    );
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
