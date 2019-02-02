import 'package:flutter/material.dart';

class BubbleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const BubbleTextField({Key key, this.label, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new TextField(
      autofocus: true,
      controller: this.controller,
      decoration: new InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: label,
      ),
      style: new TextStyle(
        color: Colors.white,
        fontSize: 20
      ),
    );
  }
}
