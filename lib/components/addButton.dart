import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

class AddButton extends StatefulWidget {
  final VoidCallback toggleAddForm;

  const AddButton({Key key, this.toggleAddForm}) : super(key: key);

  @override
  _AddButtonState createState() => new _AddButtonState();
}

class _AddButtonState extends State<AddButton>
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
              widget.toggleAddForm();
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
      widget.toggleAddForm();
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        alignment: buttonBottomCenterAnimation.value,
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
                child: new Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ));
  }
}
