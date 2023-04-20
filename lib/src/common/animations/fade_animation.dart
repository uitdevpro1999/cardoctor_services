import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY, translateX }
enum FadeDirection { up, down }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final FadeDirection direction;
  final bool playAnimation;

  const FadeAnimation({
    Key? key,
    required this.delay,
    required this.child,
    this.direction = FadeDirection.down,
    AssetImage? image,
    this.playAnimation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(
        AniProps.opacity,
        Tween(begin: 0.0, end: 1.0),
        const Duration(milliseconds: 300),
      )
      ..add(
        AniProps.translateY,
        Tween(
          begin: direction == FadeDirection.down ? -30.0 : 30.0,
          end: 0.0,
        ),
        const Duration(milliseconds: 300),
        Curves.easeOut,
      );

    return playAnimation
        ? PlayAnimation<MultiTweenValues<AniProps>>(
            delay: Duration(milliseconds: (500 * delay).round()),
            duration: tween.duration,
            tween: tween,
            child: child,
            builder: (context, child, value) => Opacity(
              opacity: value.get(AniProps.opacity),
              child: Transform.translate(
                offset: Offset(
                  0,
                  value.get(AniProps.translateY),
                ),
                child: child,
              ),
            ),
          )
        : child;
  }
}
