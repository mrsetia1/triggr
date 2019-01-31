import 'package:flutter/material.dart';

import 'package:triggr/components/headerClipper.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: MediaQuery.of(context).size.width,
        child: new GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(":triggr:",
                    style: TextStyle(color: Colors.white, fontSize: 35)),
              ),
            ),
          ),
        ));
  }
}
