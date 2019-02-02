import 'package:flutter/material.dart';

class BubbleButton extends StatelessWidget {
  final VoidCallback onClick;
  final bool isDisabled;
  final String text;

  const BubbleButton({Key key, this.text, this.onClick, this.isDisabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Opacity(
        opacity: isDisabled ? 0.4 : 1.0,
        child: new FlatButton(
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: new Text(text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 30)),
          ),
          onPressed: isDisabled ? null : onClick,
          splashColor: Colors.lightBlueAccent,
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}
