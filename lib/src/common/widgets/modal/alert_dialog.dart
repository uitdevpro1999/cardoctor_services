// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/primary_button.dart';
import '../buttons/secondary_button.dart';

// Project imports:
typedef Int2VoidFunc = void Function(BuildContext context);
BuildContext? thisContext;

void showAlertDialog(
  BuildContext context, {
  String message = '',
  Widget? widget,
  String title = 'Thông báo',
  callback1,
  callback2,
  barrierDismissible = true,
  bool? isVisible = true,
  String? primaryButtonTitle,
  Int2VoidFunc? onSecondaryButtonTap,
  Int2VoidFunc? onPrimaryButtonTap,
  String? secondaryButtonTitle,
  Widget? content,
}) {
  showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (dialogContext) {
      thisContext = dialogContext;
      return WillPopScope(
          child: AlertDialog(
            // insetPadding: const EdgeInsets.all(10),
              actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              contentPadding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 36),
              title: Text(title, textAlign: TextAlign.center),
              content: content ?? Text(message, textAlign: TextAlign.center),
              actions: [
                Row(
                  children: [
                    Visibility(
                      visible: (secondaryButtonTitle ?? '').isNotEmpty ? true : false,
                      child: Expanded(
                        child: SizedBox(
                          height: 50,
                          child: SecondaryButton(
                            onTap: () {
                              if (onSecondaryButtonTap != null) {
                                onSecondaryButtonTap(dialogContext);
                              } else {
                                Navigator.of(dialogContext).pop();
                              }
                            },
                            title: secondaryButtonTitle ?? '',
                          ),
                        ),
                      ),
                    ),
                    (secondaryButtonTitle ?? '').isNotEmpty ? SizedBox(width: 20) : const SizedBox.shrink(),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: PrimaryButton(
                          onTap: () {
                            if (onPrimaryButtonTap != null) {
                              onPrimaryButtonTap(dialogContext);
                            } else {
                              Navigator.of(dialogContext).pop();
                            }
                          },
                          title: primaryButtonTitle ?? '',
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
          onWillPop: () async => barrierDismissible);
    },
  );
}
BuildContext? getContext() => thisContext;
