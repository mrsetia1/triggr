import 'package:flutter/material.dart';

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
          children: <Widget>[],
        ),
      ),
    );
  }
}
