import 'package:flutter/material.dart';

import 'package:triggr/components/addButton.dart';
import 'package:triggr/components/header.dart';
import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/reason.dart';
import 'package:triggr/components/triggerList.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final triggers = List<Trigger>.generate(
    30,
    (i) => Trigger("I don't like $i", "Because it's scary", new List<Reason>()),
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
          children: <Widget>[_buildList(), _buildHeader(), _buildFab()],
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
        width: MediaQuery.of(context).size.width, top: 0, child: new Header());
  }

  Widget _buildList() {
    return Positioned(
      top: 80,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child:  new TriggerList(triggers: triggers),
      ),
    );
  }
}
