import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions { Increment }

int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) return state + 1;
  return state;
}

void main() {
  final store = Store<int>(counterReducer, initialState: 0);
  runApp(ReduxDemo(
    title: 'redux-demo',
    store: store,
  ));
}

class ReduxDemo extends StatelessWidget {
  final Store store;
  final String title;
  ReduxDemo({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        theme: new ThemeData.dark(),
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: StoreConnector<int, String>(
              converter: (store) => store.state.toString(),
              builder: (context, count) {
                return Text(
                  count,
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ),
          //泛型，store的类型，converter的返回值的类型
          floatingActionButton: StoreConnector<int, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(Actions.Increment);
            },
            builder: (context, callback) {
              return FloatingActionButton(
                onPressed: callback,
                tooltip: 'incre',
                child: Icon(Icons.add),
              );
            },
          ),
        ),
      ),
    );
  }
}
