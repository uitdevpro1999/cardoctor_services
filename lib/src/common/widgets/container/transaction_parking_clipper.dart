import 'package:flutter/material.dart';

class ParkingClipper extends CustomClipper<Path> {
  final cardRadius = 12.0;
  final bigRadius = 8.0;
  final factor = 4.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(cardRadius),
    ));

    Path clipPath = Path();
    clipPath.addOval(Rect.fromCircle(
      center: Offset(0, size.height * 0.6 + bigRadius),
      radius: bigRadius,
    ));
    clipPath.addOval(Rect.fromCircle(
      center: Offset(size.width, size.height * 0.6 + bigRadius),
      radius: bigRadius,
    ));

    final ticketPath = Path.combine(
      PathOperation.reverseDifference,
      clipPath,
      path,
    );
    return ticketPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

