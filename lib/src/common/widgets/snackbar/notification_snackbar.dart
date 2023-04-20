import 'package:flutter/material.dart';

class NotificationSnackbar extends SnackBar {
  NotificationSnackbar({
    Key? key,
    required BuildContext context,
    Widget? icon,
    String? title,
    required String message,
    String? actionLabel = 'Đóng',
    void Function()? onActionTap,
    Duration duration = const Duration(seconds: 4),
  }) : super(
          key: key,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          behavior: SnackBarBehavior.floating,
          duration: duration,
          dismissDirection: DismissDirection.horizontal,
          content: Row(
            children: [
              icon ??
                  const Icon(
                    Icons.notifications_active_rounded,
                    color: Color.fromRGBO(202, 157, 0, 1.0),
                  ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title != null && title.isNotEmpty
                        ? Text(
                            title,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )
                        : const SizedBox.shrink(),
                    title != null && title.isNotEmpty
                        ? const SizedBox(height: 4.0)
                        : const SizedBox.shrink(),
                    Text(
                      message,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.white,
                          ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
}

Future<void> showInAppNotification({
  required BuildContext context,
  String? title,
  required String message,
  void Function()? onActionTap,
  Duration duration = const Duration(seconds: 30),
}) async {
  final snackBar = NotificationSnackbar(
    context: context,
    duration: duration,
    title: title,
    message: message,
    onActionTap: onActionTap,
  );
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
