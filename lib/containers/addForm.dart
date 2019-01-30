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
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
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
                  onClick: null,
                ),
                new Text(
                  textController.text,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
        ));
  }
}
