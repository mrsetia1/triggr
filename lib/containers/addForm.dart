import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:triggr/actions/triggers.dart';

import 'package:triggr/components/bubbleButton.dart';
import 'package:triggr/components/bubbleTextField.dart';
import 'package:triggr/components/bubbleHeader.dart';

import 'package:triggr/models/triggerState.dart';

class _ViewModel {
  final VoidCallback addTrigger;
  final VoidCallback addReason;

  _ViewModel({@required this.addTrigger, @required this.addReason});
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
  TextEditingController reasonTextController;
  int _currentStep;

  @override
  void initState() {
    _currentStep = 0;

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
            addReason: () => store.dispatch(new AddTriggerReasonAction(
                store.state.activeTrigger.id, reasonTextController.text)),
            addTrigger: () =>
                store.dispatch(new AddTriggerAction(textController.text))),
        builder: (context, viewModel) => new Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 40, right: 40),
              child: new AnimatedCrossFade(
                duration: Duration(milliseconds: 500),
                firstChild: _addTriggerStep(viewModel),
                secondChild: _addReasonsStep(viewModel),
                crossFadeState: _currentStep == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            )));
  }

  Widget _addTriggerStep(_ViewModel viewModel) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BubbleHeader(text: "What's up?"),
          BubbleTextField(
            onSubmitted: () {
              viewModel.addTrigger();
              setState(() {
                _currentStep = 1;
              });
            },
            controller: textController,
          ),
          BubbleButton(
            text: "Next",
            isDisabled: textController.text.isEmpty,
            onClick: () {
              viewModel.addTrigger();
              setState(() {
                _currentStep = 1;
              });
            },
          ),
        ]);
  }

  Widget _addReasonsStep(_ViewModel viewModel) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BubbleHeader(text: "What might happen?"),
          BubbleTextField(
            onSubmitted: () {
              viewModel.addReason();
            },
            controller: reasonTextController,
          ),
          BubbleButton(
            text: "Ok",
            isDisabled: textController.text.isEmpty,
            onClick: () {
              viewModel.addReason();
            },
          ),
        ]);
  }
}
