import 'package:flutter/material.dart';

class BubbleButton extends StatelessWidget {
  final VoidCallback onClick;

  const BubbleButton({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onClick,
      child: Text('Submit'),
    );

  }
}
