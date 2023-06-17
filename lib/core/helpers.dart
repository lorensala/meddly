import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';

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

List<BoxShadow> boxShadow(BuildContext context) {
  return [
    BoxShadow(
      color: context.colorScheme.onBackground.withOpacity(0.1),
      blurRadius: 10,
      offset: const Offset(2, 2),
    ),
  ];
}

Future<DateTime?> showAdaptiveDatePicker({
  required BuildContext context,
  required DateTime initialDateTime,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  if (Platform.isAndroid) {
    return showDatePicker(
      context: context,
      initialDate: initialDateTime,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now(),
    );
  } else {
    return showCupertinoDatePicker(
      context: context,
      initialDateTime: initialDateTime,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }
}

Future<DateTime?> showCupertinoDatePicker({
  required BuildContext context,
  required DateTime initialDateTime,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  DateTime? dateTime = initialDateTime;

  await showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (_) => Container(
      color: context.colorScheme.secondary,
      height: MediaQuery.of(context).size.height / 2,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initialDateTime,
                minimumDate: firstDate ?? DateTime(1900),
                maximumDate: lastDate ?? DateTime.now(),
                onDateTimeChanged: (value) {
                  dateTime = value;
                },
              ),
            ),
            CupertinoButton(
              child: Text(context.l10n.accept),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            const SizedBox(height: Sizes.medium),
          ],
        ),
      ),
    ),
  );

  return dateTime;
}

Future<TimeOfDay?> showAdaptiveTimePicker({
  required BuildContext context,
  required TimeOfDay initialTimeOfDay,
}) async {
  if (Platform.isAndroid) {
    return showTimePicker(
      context: context,
      initialTime: initialTimeOfDay,
    );
  } else {
    return showCupertinoTimePicker(
      context: context,
      initialTime: initialTimeOfDay,
    );
  }
}

Future<TimeOfDay?> showCupertinoTimePicker({
  required BuildContext context,
  required TimeOfDay initialTime,
}) async {
  TimeOfDay? timeOfDay = initialTime;

  await showCupertinoModalPopup<TimeOfDay>(
    context: context,
    builder: (_) => Container(
      color: context.colorScheme.secondary,
      height: MediaQuery.of(context).size.height / 2,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  initialTime.hour,
                  initialTime.minute,
                ),
                onDateTimeChanged: (value) {
                  timeOfDay = TimeOfDay.fromDateTime(value);
                },
              ),
            ),
            CupertinoButton(
              child: Text(context.l10n.accept),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            const SizedBox(height: Sizes.medium),
          ],
        ),
      ),
    ),
  );

  return timeOfDay;
}
