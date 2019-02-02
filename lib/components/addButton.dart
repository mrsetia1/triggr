import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

class AddButton extends StatefulWidget {
  final VoidCallback toggleAddForm;
  final bool isFinished;

  const AddButton({Key key, this.toggleAddForm, this.isFinished}) : super(key: key);

  @override
  _AddButtonState createState() => new _AddButtonState();
}

class _AddButtonState extends State<AddButton>
    with SingleTickerProviderStateMixin {
  bool _isOpened = false;
  double maxHeight;
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

    buttonZoomOutAnimation = new Tween(
      begin: 150.0,
      end: 1000.0,
    ).animate(buttonGrowAnimation);

    _animationController.reverse();

    super.initState();
  }

  @override
  void didUpdateWidget(AddButton oldWidget) {
    if (widget.isFinished && widget.isFinished != oldWidget.isFinished) {
      _isOpened = !_isOpened;
      _animationController.reverse();
      super.didUpdateWidget(oldWidget);
    } else {
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!_isOpened) {
      _animationController.forward();
    } else {
      widget.toggleAddForm();
      _animationController.reverse();
    }
    _isOpened = !_isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
            alignment: Alignment.bottomCenter,
            child: new Container(
                width: buttonZoomOutAnimation.value,
                height: buttonZoomOutAnimation.value,
                alignment: Alignment.bottomCenter,
                decoration: new BoxDecoration(
                    color: Colors.lightBlue,
                    shape: buttonZoomOutAnimation.value < 400
                        ? BoxShape.circle
                        : BoxShape.rectangle))),
        Positioned(
            bottom: 100,
            child: GestureDetector(
              onVerticalDragStart: (state) {
                _animationController.isAnimating ? null: animate();
              },
              onTap: () {
                _animationController.isAnimating ? null: animate();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                child: Transform.rotate(
                  angle: buttonZoomOutAnimation.value < 200
                      ? 0
                      : (buttonZoomOutAnimation.value / 200) - 1.08,
                  child: new Icon(
                    Icons.add,
                    size: 55,
                    color: Colors.white70,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
