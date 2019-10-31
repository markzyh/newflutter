import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

//登陆信息类型
class AuthState {
  bool isLogin;
  UserInfo userInfo;
  AuthState(this.isLogin, this.userInfo);
}

class UserInfo {
  String userName;
  String userId;
  UserInfo(this.userName, this.userId);
}

enum Actions { Login, Logout }

AuthState authReducer(AuthState state, dynamic action) {
  if (action == Actions.Login) {
    state.isLogin = true;
    state.userInfo.userName = 'markzyh';
    return state;
  } else if (action == Actions.Logout) {
    state.isLogin = false;
    state.userInfo.userName = '';
  }
  return state;
}

void main() {
  final store = Store<AuthState>(authReducer,
      initialState: AuthState(false, UserInfo('userName', 'id:0')));
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
    return StoreProvider<AuthState>(
      store: store,
      child: MaterialApp(
        theme: new ThemeData.dark(),
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: StoreConnector<AuthState, String>(
              //converter转换器
              converter: (store) => store.state.userInfo.userName.toString(),
              builder: (context, userName) {
                return Text(
                  userName,
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ),
          //泛型，store的类型，converter的返回值的类型
          floatingActionButton: StoreConnector<AuthState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(Actions.Login);
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
