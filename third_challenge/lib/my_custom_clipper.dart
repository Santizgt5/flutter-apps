import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path> {

  @override
  getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height - 40);
    var firtsStart = Offset(size.width / 6.50, size.height - 80);
    var firtsEnd = Offset(size.width / 2.95, size.height - 40);
    path.quadraticBezierTo(firtsStart.dx, firtsStart.dy, firtsEnd.dx, firtsEnd.dy);
    var secondStart = Offset(size.width / 2, size.height);
    var secondEnd = Offset(size.width - (size.width  / 2.95), size.height - 40);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    var thirdStart = Offset(size.width - (size.width / 6.50), size.height - 80);
    var thirdEnd = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}