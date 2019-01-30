import 'package:flutter/material.dart';

import 'package:triggr/components/addButton.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

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
