import 'package:flutter/material.dart';
import '../../../gen/colors.gen.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final EdgeInsets? padding;
  final double borderRadius;
  final bool enabled;

  const PrimaryButton({
    Key? key,
    this.onTap,
    required this.title,
    this.padding,
    this.borderRadius = 12.0,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: enabled ? null : Colors.grey.shade300,
        gradient: enabled
            ? const LinearGradient(
                colors: <Color>[
                  ColorName.primaryGradientStart,
                  ColorName.primaryGradientEnd,
                ],
              )
            : null,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
          visualDensity: VisualDensity.standard,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          primary: enabled ? Colors.white : Colors.grey.shade600,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: Theme.of(context).textTheme.button!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: enabled ? Colors.white : Colors.grey.shade600,
              ),
        ),
      ),
    );
  }
}
