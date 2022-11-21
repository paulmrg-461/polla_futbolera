import 'package:flutter/material.dart';
import 'package:polla_futbolera/ui/themes/main_theme.dart';

class CustomAlertDialog {
  Future<void> showCustomDialog(
      {required BuildContext context,
      required String title,
      required String content,
      required String actionText}) async {
    return showDialog(
        context: context,
        builder: (context) =>
            _alertDialog(context, title, content, actionText));
  }

  AlertDialog _alertDialog(
      BuildContext context, String title, String content, String actionText) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              actionText,
              style: const TextStyle(color: MainTheme.primaryColor),
            ))
      ],
    );
  }
}
