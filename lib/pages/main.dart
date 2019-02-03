import 'package:flutter/material.dart';
import 'package:flutter_mmkv/flutter_mmkv.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';

import 'package:triggr/models/trigger.dart';
import 'package:triggr/components/addButton.dart';
import 'package:triggr/components/header.dart';
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
  List<Trigger> storedTriggers;


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String storedTriggersJSON;
    List<Trigger> storedTriggers = new List<Trigger>();
    List<Trigger> triggers;

    var uuid = new Uuid();

    Trigger trigger = new Trigger(uuid.v1().toString(), "stored");
    Trigger trigger2 = new Trigger(uuid.v1().toString(), "also stored");

    triggers = new List<Trigger>()..add(trigger);
    triggers.add(trigger2);
    
    var encodedList = jsonEncode(triggers.map((t) => t.toJson()).toList());

    FlutterMmkv.encodeString("mytriggers", encodedList);

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      storedTriggersJSON = await FlutterMmkv.decodeString("mytriggers");
    } on Exception {
       print('Failed to get local data.');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    var storedTriggerList = jsonDecode(storedTriggersJSON).map((t) => Trigger.fromJson(t));

    storedTriggerList.forEach((t) =>
        storedTriggers.add(t)
    );

    print(storedTriggerList.toString());
    print(storedTriggers.toString());
  }

  @override
  void initState() {
    initPlatformState();
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
