import 'package:flutter/material.dart';

import 'package:triggr/containers/addForm.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String title;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new AddForm()
          ],
        ),
      ),
    );
  }
}
