import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/widgets.dart';

class InfoMessenger {
  static void showSuccess(
      {required BuildContext context,
      required String description,
      required String title}) {
    ElegantNotification.success(
      description: Text(description),
      title: Text(title),
      width: 600,
    ).show(context);
  }

  static void showError(
      {required BuildContext context,
      required String description,
      required String title}) {
    ElegantNotification.error(
      description: Text(description),
      title: Text(title),
      width: 600,
    ).show(context);
  }

  static void showInfo(
      {required BuildContext context,
      required String description,
      required String title}) {
    ElegantNotification.info(
      description: Text(description),
      title: Text(title),
      width: 600,
    ).show(context);
  }
}
