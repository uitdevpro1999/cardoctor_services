import 'package:flutter/material.dart';

class TicketBottomJagClipper extends CustomClipper<Path> {
  final radius = 5.0;
  final numberOfJag = 20;
  final distance = 4.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    var curXPos = 0.0;
    var curYPos = size.height;
    var increment = (size.width - distance * (numberOfJag + 1)) / numberOfJag;
    while (curXPos <= size.width - distance * 2) {
      curXPos += distance;
      path.lineTo(curXPos, curYPos);
      curXPos += increment;
      path.arcToPoint(
        Offset(curXPos, curYPos),
        radius: Radius.circular(radius),
      );
    }
    path.lineTo(size.width, curYPos);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
