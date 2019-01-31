import 'package:flutter/material.dart';

import 'package:triggr/components/addButton.dart';
import 'package:triggr/components/dashButton.dart';
import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/reason.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final triggers = List<Trigger>.generate(
    30,
    (i) => Trigger("What's this? $i", new List<Reason>()),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[_buildHeader(), _buildList(), _buildFab()],
        ),
      ),
    );
  }

  Widget _buildFab() {
    return new Positioned(
        bottom: -100,
        width: MediaQuery.of(context).size.width,
        child: new AddButton());
  }

  Widget _buildHeader() {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      top: 0,
      child: new DashButton()
    );
  }

  Widget _buildList() {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0, left: 20, bottom: 60),
      child: Container(
        height: MediaQuery.of(context).size.height - 60,
        child: ListView.builder(
          // Let the ListView know how many items it needs to build
          itemCount: triggers.length,
          // Provide a builder function. This is where the magic happens! We'll
          // convert each item into a Widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = triggers[index];
            return ListTile(
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          },
        ),
      ),
    );
  }
}
