import 'package:flutter/material.dart';

class CustomAlertDialog {
  static void okDialog({
      required BuildContext context,
      required String message,
      required Color primaryColor,
      required String title,
      required void Function() onOkPressed,
    }) {
    _generalDialog(
      context: context, message: message, primaryColor: primaryColor,
      title: title, onOkPressed: onOkPressed,
      actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              onOkPressed();
            },
            child: Text(
              'OK',
              style: TextStyle(color: primaryColor),
            ),
          ),
      ]
    );
  }

  static void _generalDialog({
      required BuildContext context,
      required String message,
      required Color primaryColor,
      required String title,
      required void Function() onOkPressed,
      required List<Widget> actions,
    }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: actions,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
