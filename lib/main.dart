import 'package:flutter/material.dart';

import 'package:triggr/fab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'triggr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title;

  @override
  void initState() {
    super.initState();
    title = 'My triggrs';
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: new Stack(
              fit: StackFit.expand,
              children: <Widget>[_buildHeader(), _buildFab()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFab() {
    return new Positioned(
        bottom: -90,
        child: Center(
          child: new AnimatedFab(
            onClick: null,
          ),
        ));
  }

  Widget _buildHeader() {
    return new Padding(
      padding: new EdgeInsets.only(top: 20.0, left: 10),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            'my triggr',
            style: new TextStyle(fontSize: 34.0),
          ),
          new Text(
            'FEBRUARY 8, 2015',
            style: new TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
    );
  }

//  Widget _buildList() {
//    return new Expanded(
//      child: new AnimatedList(
//        initialItemCount: tasks.length,
//        key: _listKey,
//        itemBuilder: (context, index, animation) {
//          return new TaskRow(
//            task: listModel[index],
//            animation: animation,
//          );
//        },
//      ),
//    );
//  }
}
