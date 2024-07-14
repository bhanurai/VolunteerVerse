import 'package:flutter/material.dart';

void showSnackBar({
  required String message,
  required BuildContext context,
  required bool isValid,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isValid ? Colors.green : Colors.red,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
