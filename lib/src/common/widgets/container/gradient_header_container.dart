import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';

class GradientHeaderContainer extends StatelessWidget {
  final double? height;
  final double radius;

  const GradientHeaderContainer({
    Key? key,
    this.height,
    this.radius = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
        gradient: const LinearGradient(
          colors: [
            ColorName.primaryGradientStart,
            ColorName.primaryGradientEnd,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
