import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/triggerState.dart';
import 'package:triggr/pages/main.dart';
import 'package:triggr/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class TriggerApp extends StatelessWidget {
  final Store<TriggerState> store;

  TriggerApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'triggr',
        initialRoute: '/',
        routes: {'/detail': (context) => DetailPage()},
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
    );
  }
}
