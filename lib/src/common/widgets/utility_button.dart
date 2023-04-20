import 'package:flutter/material.dart';

import 'container/shadow_card.dart';

class UtilityButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function()? onTap;

  const UtilityButton({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ShadowCard(
        shadowOpacity: 0.2,
        child: Material(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16.0),
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.fromLTRB(4, 16, 4, 12),
              child: Column(
                children: [
                  Expanded(child: icon),
                  SizedBox(height: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
