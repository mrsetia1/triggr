import 'package:flutter/material.dart';

class BubbleTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmitted;
  final String label;

  const BubbleTextField({Key key, this.label, this.controller, this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new TextField(
      autofocus: true,
      controller: this.controller,
      onSubmitted: (String foo) {
        onSubmitted();
      },
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
