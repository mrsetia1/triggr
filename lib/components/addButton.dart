import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

class AddButton extends StatefulWidget {

  const AddButton({Key key}) : super(key: key);

  @override
  _AnimatedFabState createState() => new _AnimatedFabState();
}

class _AnimatedFabState extends State<AddButton>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<double> buttonZoomOutAnimation;
  Animation<double> buttonGrowAnimationOut;
  Animation<Alignment> buttonBottomCenterAnimation;
  Animation<double> buttonGrowAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            if (_animationController.isCompleted) {
              Navigator.pushNamed(context, "/add");
            }
            setState(() {});
          });

    buttonGrowAnimation = new CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
    );

    buttonBottomCenterAnimation = new AlignmentTween(
      begin: Alignment.bottomCenter,
      end: Alignment.center,
    ).animate(buttonGrowAnimation);

    buttonZoomOutAnimation = new Tween(
      begin: 150.0,
      end: 1000.0,
    ).animate(buttonGrowAnimation);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.lightBlueAccent[100],
                Colors.lightBlue[100]
              ],
            ),
            shape: buttonZoomOutAnimation.value < 400
                ? BoxShape.circle
                : BoxShape.rectangle),
        alignment: buttonBottomCenterAnimation.value,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new GestureDetector(
            onVerticalDragStart: (state) {
              animate();
            },
            onTap: () {
              animate();
            },
            child: new Container(
              width: buttonZoomOutAnimation.value,
              height: buttonZoomOutAnimation.value,
              alignment: buttonBottomCenterAnimation.value,
              decoration: new BoxDecoration(
                  color: Colors.lightBlue,
                  shape: buttonZoomOutAnimation.value < 400
                      ? BoxShape.circle
                      : BoxShape.rectangle),
              child: Container(
                alignment: Alignment.topCenter,
                child: AnimatedOpacity(
                  opacity: buttonZoomOutAnimation.value < 400 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 250),
                  child: FloatingActionButton(
                    onPressed: null,
                    child: new Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
