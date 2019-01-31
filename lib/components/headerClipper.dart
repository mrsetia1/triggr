import 'package:flutter/material.dart';

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 2);

    var point =
    Offset(size.width - (size.width / 2), size.height);
    var endPoint = Offset(size.width, size.height /2);
    path.quadraticBezierTo(point.dx, point.dy,
        endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
