import 'package:flutter/material.dart';

import 'package:triggr/components/bubbleButton.dart';
import 'package:triggr/components/bubbleTextField.dart';
import 'package:triggr/components/bubbleHeader.dart';

class AddForm extends StatefulWidget {
  final Function(String) onAdd;

  const AddForm({Key key, this.onAdd}) : super(key: key);

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
        setState(() { });
      });
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
          padding: const EdgeInsets.only(top: 100.0, left: 40, right: 40),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BubbleHeader(text: "What's up?"),
                BubbleTextField(
                  controller: textController,
                ),
                BubbleButton(
                  text: "Ok",
                  isDisabled: textController.text.isEmpty,
                  onClick: () {
                    widget.onAdd(textController.text);
                  },
                ),
              ]),
        ));
  }
}
