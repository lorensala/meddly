import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';

class DateSelector extends HookWidget {
  const DateSelector({
    super.key,
    required this.initialDateTime,
    required this.onDateTimeChanged,
    required this.errorText,
  });

  final DateTime initialDateTime;
  final String? errorText;
  final void Function(DateTime value) onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    final textStyle = useState<TextStyle>(context.textTheme.bodyLarge!
        .copyWith(color: context.colorScheme.onSecondary.withOpacity(0.5)),);
    final controller = useTextEditingController(text: 'Select a date');

    return TextFormField(
      controller: controller,
      style: textStyle.value,
      onTap: () async {
        if (Platform.isAndroid) {
          final value = await showDatePicker(
            context: context,
            initialDate: initialDateTime,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (value != null) {
            controller.text = value.toString().dateTimeStringFormat();
            textStyle.value = context.textTheme.bodyLarge!;
            onDateTimeChanged(value);
          } else {
            controller.text = 'Select a date';
            textStyle.value = context.textTheme.bodyLarge!.copyWith(
                color: context.colorScheme.onSecondary.withOpacity(0.5),);
            onDateTimeChanged(initialDateTime);
          }
        } else {
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
                        minimumDate: DateTime(1900),
                        maximumDate: DateTime.now(),
                        onDateTimeChanged: (value) {
                          controller.text =
                              value.toString().dateTimeStringFormat();
                          textStyle.value = context.textTheme.bodyLarge!;
                          onDateTimeChanged(value);
                        },
                      ),
                    ),
                    CupertinoButton(
                      child: Text(context.l10n.accept),
                      onPressed: () {
                        if (controller.text == 'Select a date') {
                          controller.text =
                              initialDateTime.toString().dateTimeStringFormat();
                          textStyle.value = context.textTheme.bodyLarge!
                              .copyWith(
                                  color: context.colorScheme.onSecondary
                                      .withOpacity(0.5),);
                          onDateTimeChanged(initialDateTime);
                        }
                        textStyle.value = context.textTheme.bodyLarge!;
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(height: Sizes.medium),
                  ],
                ),
              ),
            ),
          );
        }
      },
      readOnly: true,
      decoration: InputDecoration(
        errorText: errorText,
      ),
    );
  }
}
