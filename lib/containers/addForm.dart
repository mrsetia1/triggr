import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:triggr/actions/triggers.dart';

import 'package:triggr/components/bubbleButton.dart';
import 'package:triggr/components/bubbleTextField.dart';
import 'package:triggr/components/bubbleHeader.dart';

import 'package:triggr/models/triggerState.dart';

class _ViewModel {
  final VoidCallback onAddPressed;

  _ViewModel({
    @required this.onAddPressed,
  });
}

class AddForm extends StatefulWidget {
  final VoidCallback closeForm;

  const AddForm({Key key, this.closeForm}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<TriggerState, _ViewModel>(
        converter: (store) => new _ViewModel(
            onAddPressed: () => store.dispatch(
                new AddTriggerAction(textController.text)
            )),
        builder: (context, viewModel) =>
        new Form(
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
                        viewModel.onAddPressed();
                        widget.closeForm();
                      },
                    ),
                  ]),
            ))
    );
  }
}
