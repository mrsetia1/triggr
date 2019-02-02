import 'package:flutter/material.dart';

class BubbleHeader extends StatelessWidget {
  final String text;

  const BubbleHeader({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: new Text(
        text,
        style: new TextStyle(
            color: Colors.white, fontWeight: FontWeight.w200, fontSize: 30),
      ),
    );
  }
}
