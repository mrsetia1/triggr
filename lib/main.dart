import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:triggr/reducers/triggers.dart';
import 'package:triggr/models/triggerState.dart';

import 'package:triggr/trigger.dart';

void main() {
  final store =
      new Store<TriggerState>(
          triggerReducer,
          middleware: [thunkMiddleware],
          initialState: TriggerState.initialState()
      );

  runApp(new FlutterReduxApp(
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<TriggerState> store;

  FlutterReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<TriggerState>(
        store: store, child: TriggerApp(store: store));
  }
}
