import 'package:flutter/material.dart';

import 'package:triggr/pages/main.dart';
import 'package:triggr/pages/detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'triggr',
      initialRoute: '/',
      routes: {
        '/detail': (context) => DetailPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}