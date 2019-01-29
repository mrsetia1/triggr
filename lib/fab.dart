import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  final VoidCallback onClick;

  const AnimatedFab({Key key, this.onClick}) : super(key: key);

  @override
  _AnimatedFabState createState() => new _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
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
    return new SizedBox(
      width: 150.0,
      height: 150.0,
      child: FloatingActionButton(
        onPressed: () {},
        child: new Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 45,
              child: Icon(Icons.add, size: 60))
        ]),
      ),
    );
  }
}
