import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../animations/fade_animation.dart';

class BasePage extends StatelessWidget {
  final Color backgroundColor;
  final String? title;
  final Widget? leading;
  final List<Widget>? trailing;
  final Widget child;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;

  const BasePage({
    Key? key,
    this.title,
    this.leading,
    this.trailing,
    required this.child,
    this.bottomNavigationBar,
    this.backgroundColor = ColorName.backgroundColor,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: title != null
          ? AppBar(
              elevation: 0.0,
              iconTheme: const IconThemeData(
                color: Colors.white, //change your color here
              ),
              centerTitle: true,
              title: FadeAnimation(
                delay: 0.5,
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              leading: leading,
              actions: trailing,
              backgroundColor: Colors.transparent,
            )
          : null,
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.transparent,
          child: child,
        ),
      ),
    );
  }
}
