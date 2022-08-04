

import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path> {

  @override
  getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(size.width, 0);
    var firtsStart = Offset(0, size.height / 2.8);
    var firtsEnd = Offset(size.width / 3, size.height);
    path.quadraticBezierTo(firtsStart.dx, firtsStart.dy, firtsEnd.dx, firtsEnd.dy);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}