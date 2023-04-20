import 'package:flutter/material.dart';

class FooterContainer extends StatelessWidget {
  final double? height;
  final Widget? child;
  final bool hasShadow;
  final Color backgroundColor;

  const FooterContainer({
    Key? key,
    this.height,
    this.child,
    this.hasShadow = true,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: height,
        color: backgroundColor,
        child: Wrap(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: hasShadow
                    ? [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset:
                              const Offset(0, -6), // changes position of shadow
                        ),
                      ]
                    : [],
              ),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
