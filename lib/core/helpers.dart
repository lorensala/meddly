import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showConfirmationDialog(
  BuildContext context,
  VoidCallback onConfirm,
) async {
  if (Platform.isAndroid) {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cancel'),
          content: const Text('Are you sure you want to cancel?'),
          actions: [
            TextButton(
              onPressed: onConfirm,
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  } else {
    await showCupertinoDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Cancel'),
          content: const Text('Are you sure you want to cancel?'),
          actions: [
            TextButton(
              onPressed: onConfirm,
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}

Future<void> showSnackBar(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 2),
}) async {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black,
        duration: duration,
      ),
    );
}
