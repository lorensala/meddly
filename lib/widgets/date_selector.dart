import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';

class DateSelector extends HookWidget {
  const DateSelector({
    required this.initialDateTime,
    required this.onDateTimeChanged,
    required this.errorText,
    this.initialValue,
    this.firstDate,
    this.lastDate,
    super.key,
  });

  final DateTime initialDateTime;
  final DateTime? initialValue;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? errorText;
  final void Function(DateTime value) onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    final textStyle = useState<TextStyle>(
      initialValue == null
          ? context.textTheme.bodyMedium!.copyWith(
              color: context.colorScheme.onSecondary.withOpacity(0.5),
            )
          : context.textTheme.bodyMedium!,
    );

    final controller = useTextEditingController(
      text: initialValue == null
          ? 'Select a date'
          : initialValue.toString().dateTimeStringFormat(),
    );

    return TextFormField(
      controller: controller,
      style: textStyle.value,
      onTap: () async {
        final textTheme = context.textTheme;
        final colorScheme = context.colorScheme;
        if (Platform.isAndroid) {
          final value = await showDatePicker(
            context: context,
            initialDate: initialDateTime,
            firstDate: firstDate ?? DateTime(1900),
            lastDate: lastDate ?? DateTime.now(),
          );

          if (value != null) {
            controller.text = value.toString().dateTimeStringFormat();
            textStyle.value = textTheme.bodyMedium!;
            onDateTimeChanged(value);
          } else {
            controller.text = 'Select a date';
            textStyle.value = textTheme.bodyMedium!.copyWith(
              color: colorScheme.onSecondary.withOpacity(0.5),
            );
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
                        minimumDate: firstDate ?? DateTime(1900),
                        maximumDate: lastDate ?? DateTime.now(),
                        onDateTimeChanged: (value) {
                          controller.text =
                              value.toString().dateTimeStringFormat();
                          textStyle.value = textTheme.bodyMedium!;
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
                          textStyle.value =
                              context.textTheme.bodyMedium!.copyWith(
                            color: context.colorScheme.onSecondary
                                .withOpacity(0.5),
                          );
                          onDateTimeChanged(initialDateTime);
                        }
                        textStyle.value = context.textTheme.bodyMedium!;
                        GoRouter.of(context).pop();
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
