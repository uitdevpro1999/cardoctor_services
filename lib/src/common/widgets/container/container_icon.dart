import 'package:flutter/material.dart';

class ContainerIcon extends StatelessWidget {
  final Color backgroundColor;
  final Widget icon;

  const ContainerIcon({
    Key? key,
    required this.backgroundColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: icon,
    );
  }
}
