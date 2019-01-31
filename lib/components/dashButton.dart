import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

import 'package:triggr/components/headerClipper.dart';

class DashButton extends StatefulWidget {
  const DashButton({Key key}) : super(key: key);

  @override
  _DashButtonState createState() => new _DashButtonState();
}

class _DashButtonState extends State<DashButton>
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
        AnimationController(vsync: this, duration: Duration(milliseconds: 750))
          ..addListener(() {
            if (_animationController.isCompleted) {
//              Navigator.pushNamed(context, "/dash");
            }
            setState(() {});
          });

    buttonGrowAnimation = new CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
    );

    buttonBottomCenterAnimation = new AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.center,
    ).animate(buttonGrowAnimation);

    buttonZoomOutAnimation = new Tween(
      begin: 100.0,
      end: 1500.0,
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
        width: MediaQuery.of(context).size.width,
        alignment: buttonBottomCenterAnimation.value,
        child: new GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: buttonZoomOutAnimation.value + 100,
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                decoration: BoxDecoration(color: Colors.lightBlue),
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
                      child: new Icon(
                        Icons.add,
                        size: 60,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          onVerticalDragStart: (state) {
            animate();
          },
          onTap: () {
            animate();
          },
        ));
  }
}
