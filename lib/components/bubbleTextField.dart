import 'package:flutter/material.dart';

class BubbleTextField extends StatelessWidget {
  final TextEditingController controller;

  const BubbleTextField({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: this.controller,
      decoration: new InputDecoration(
        labelText: "Enter Something",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: new TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: "Poppins",
      ),
    );
  }
}
