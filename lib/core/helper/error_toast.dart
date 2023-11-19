import 'package:flutter/material.dart';

final class ToastMessage {
  static Future<void> toastMessage(BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
      ),
    )));
  }
}
