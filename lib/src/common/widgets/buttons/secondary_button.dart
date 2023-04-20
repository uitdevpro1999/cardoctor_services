import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';

class SecondaryButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Widget? icon;
  final EdgeInsets? padding;
  final double borderRadius;
  final bool enabled;

  const SecondaryButton({
    Key? key,
    this.onTap,
    this.title = 'Huỷ',
    this.icon,
    this.padding,
    this.borderRadius = 12.0,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: enabled ? null : Colors.grey.shade300,
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
        visualDensity: VisualDensity.standard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          color: enabled ? ColorName.textGray2 : Colors.grey.shade600,
          width: 1.0,
        ),
        primary: enabled ? ColorName.textGray2 : Colors.grey.shade600,
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? const SizedBox.shrink(),
          if (icon != null) SizedBox(width: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.button!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: enabled ? ColorName.textGray1 : Colors.grey.shade600,
                ),
          ),
        ],
      ),
    );
  }
}
