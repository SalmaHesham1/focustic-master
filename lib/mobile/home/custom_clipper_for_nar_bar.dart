import 'package:flutter/material.dart';

class CustomClipperForNavBar extends CustomClipper<Path> {
  bool isBigContainer;

  CustomClipperForNavBar({required this.isBigContainer});

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    // throw UnimplementedError();
    var path = Path();

    path.lineTo(0, 0);
    path.lineTo(isBigContainer ? size.width / 3 + 11 : size.width / 3 + 10, 0);
    path.quadraticBezierTo(
        size.width / 2,
        isBigContainer ? size.height * 1.3 - 7 : size.height * 1.3,
        isBigContainer ? size.width / 3 * 2 - 11 : size.width / 3 * 2 - 10,
        0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    // throw UnimplementedError();
    return true;
  }
}
