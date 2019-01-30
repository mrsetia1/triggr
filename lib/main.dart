import 'package:flutter/material.dart';

import 'package:triggr/pages/add.dart';
import 'package:triggr/containers/addButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'triggr',
      initialRoute: '/',
      routes: {
        '/add': (context) => AddPage()
      },
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
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.tealAccent[100],
              Colors.cyan[100]
            ],
          ),
        ),
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[_buildFab()],
        ),
      ),
    );
  }

  Widget _buildFab() {
    return new Positioned(
        bottom: -110,
        width: MediaQuery.of(context).size.width,
        child: new AddButton());
  }

//  Widget _buildHeader() {
//    return new Padding(
//      padding: new EdgeInsets.only(top: 40.0, left: 20),
//      child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          new Text(
//            'Hello there?',
//            style: new TextStyle(fontSize: 34.0),
//          ),
//        ],
//      ),
//    );
//  }

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
