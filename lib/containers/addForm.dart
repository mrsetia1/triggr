import 'package:flutter/material.dart';

import 'package:triggr/components/bubbleButton.dart';
import 'package:triggr/components/bubbleTextField.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key key}) : super(key: key);

  @override
  _AddFormState createState() => new _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void doStuff() {
    textController.text = "OMG";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BubbleTextField(
                  controller: textController,
                ),
                BubbleButton(
                  onClick: doStuff,
                ),
              ]),
        ));
  }
}
