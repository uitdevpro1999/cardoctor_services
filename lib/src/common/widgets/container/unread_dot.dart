import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';

class UnreadDot extends StatefulWidget {
  const UnreadDot({
    Key? key,
  }) : super(key: key);

  @override
  State<UnreadDot> createState() => _UnreadDotState();
}

class _UnreadDotState extends State<UnreadDot> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 2.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [
            ColorName.primaryGradientStart,
            ColorName.primaryGradientEnd,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(231, 92, 22, 0.4),
            blurRadius: _animation.value,
            spreadRadius: _animation.value,
          ),
        ],
      ),
    );
  }
}
