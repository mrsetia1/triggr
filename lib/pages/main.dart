import 'package:flutter/material.dart';

import 'package:triggr/components/addButton.dart';
import 'package:triggr/components/header.dart';
import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/reason.dart';
import 'package:triggr/containers/triggerList.dart';
import 'package:triggr/containers/addForm.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _showAddForm = false;
  bool _isFinished = false;
  final _triggers = List<Trigger>();

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
          children: <Widget>[_buildList(), _buildHeader(), _buildAdd()],
        ),
      ),
    );
  }

  Widget _buildAdd() {
    return new Stack(children: _getAddWidgets());
  }

  closeForm() {
    setState(() {
      _showAddForm = !_showAddForm;
      _isFinished = true;
    });
  }

  List<Widget> _getAddWidgets() {
    List<Widget> wArr = new List<Widget>();

    wArr.add(Positioned(
      width: MediaQuery.of(context).size.width,
      bottom: -100,
      child: AddButton(
        isFinished: _isFinished,
        toggleAddForm: () {
          setState(() {
            _isFinished = false;
            _showAddForm = !_showAddForm;
          });
        },
      ),
    ));

    if (_showAddForm) {
      wArr.add(new AddForm(closeForm: closeForm));
    }

    return wArr;
  }

  Widget _buildHeader() {
    return Positioned(
        width: MediaQuery.of(context).size.width, top: 0, child: new Header());
  }

  Widget _buildList() {
    return Positioned(
      top: 80,
      width: MediaQuery.of(context).size.width,
      child: new TriggerListContainer(),
    );
  }
}
