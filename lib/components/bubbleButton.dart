import 'package:flutter/material.dart';

class BubbleButton extends StatefulWidget {
  final VoidCallback onClick;

  const BubbleButton({Key key, this.onClick}) : super(key: key);

  @override
  _BubbleButtonState createState() => new _BubbleButtonState();
}

class _BubbleButtonState extends State<BubbleButton> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: () {
        // Validate will return true if the form is valid, or false if
        // the form is invalid.
        if (_formKey.currentState.validate()) {
          // If the form is valid, display a snackbar. In the real world, you'd
          // often want to call a server or save the information in a database
          Scaffold
              .of(context)
              .showSnackBar(SnackBar(content: Text('Processing Data')));
        }
      },
      child: Text('Submit'),
    );

  }
}
