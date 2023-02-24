import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/controller/controller.dart';
import 'package:meddly/features/setup/provider/provider.dart';
import 'package:meddly/features/user/controller/controller.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class SetupForm extends StatelessWidget {
  const SetupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
      ),
      padding: Sizes.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _NameInput(),
          SizedBox(height: Sizes.mediumSpacing),
          _LastnameInput(),
          SizedBox(height: Sizes.mediumSpacing),
          _BirthdateInput(),
          SizedBox(height: Sizes.mediumSpacing),
          _SexSelector(),
          SizedBox(height: Sizes.mediumSpacing),
          _HeightInput(),
          SizedBox(height: Sizes.mediumSpacing),
          _WeightInput(),
          SizedBox(height: Sizes.mediumSpacing),
          _SaveButton()
        ],
      ),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final isValid = ref.watch(requiredFieldsAreValidProvider);
    final isLoading = ref.watch(userControllerProvider).isLoading;

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: notifier.save,
      label: context.l10n.createAccount,
    );
  }
}

class _SexSelector extends ConsumerWidget {
  const _SexSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final sex = ref.watch(setupSexProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(
          label: context.l10n.sexHint,
          isRequired: true,
        ),
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: sex.value,
              onChanged: (value) => notifier.sexChanged(value: value!),
            ),
            Text(
              context.l10n.male,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
        Row(
          children: [
            Radio<bool>(
              value: false,
              groupValue: sex.value,
              onChanged: (value) => notifier.sexChanged(value: value!),
            ),
            Text(
              context.l10n.female,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
        InputDescription(
          description: context.l10n.sexDescription,
        ),
        GestureDetector(
          // TODO: Make this a route or an alert dialog...
          //onTap: () => Navigator.push(context, route),
          child: Text(
            context.l10n.sexWhy,
            style: TextStyle(
              color: context.colorScheme.primary,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
            ),
          ),
        )
      ],
    );
  }
}

class _BirthdateInput extends HookConsumerWidget {
  const _BirthdateInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final notifier = ref.watch(setupControllerProvider.notifier);
    final birthdate = ref.watch(setupBirthdateProvider);
    final errorText = ref.watch(birthdateErrorMessageProvider);

    final initialDateTime =
        DateTime.tryParse(birthdate.value) ?? DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(
          label: context.l10n.birthdateHint,
          isRequired: true,
        ),
        const SizedBox(height: Sizes.smallSpacing),
        TextFormField(
          controller: controller,
          onTap: () async {
            if (Platform.isAndroid) {
              await showDatePicker(
                context: context,
                initialDate: initialDateTime,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              ).then((value) {
                if (value != null) {
                  controller.text = value.toString().dateTimeStringFormat();
                  notifier.birthdateChanged(value.toString());
                }
              });
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
                              notifier.birthdateChanged(value.toString());
                            },
                          ),
                        ),
                        CupertinoButton(
                          child: Text(context.l10n.accept),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(height: Sizes.mediumSpacing),
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
        ),
      ],
    );
  }
}

class _NameInput extends ConsumerWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final errorText = ref.watch(nameErrorMessageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: context.l10n.nameHint, isRequired: true),
        const SizedBox(height: Sizes.smallSpacing),
        TextFormField(
          onChanged: notifier.nameChanged,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}

class _LastnameInput extends ConsumerWidget {
  const _LastnameInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final errorText = ref.watch(lastnameErrorMessageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: context.l10n.lastNameHint, isRequired: true),
        const SizedBox(height: Sizes.smallSpacing),
        TextFormField(
          onChanged: notifier.lastnameChanged,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}

class _WeightInput extends ConsumerWidget {
  const _WeightInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final errorText = ref.watch(weightErrorMessageProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(
          label: '${context.l10n.weightHint} (kg)',
          isRequired: false,
        ),
        const SizedBox(height: Sizes.smallSpacing),
        TextFormField(
          onChanged: notifier.weightChanged,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}

class _HeightInput extends ConsumerWidget {
  const _HeightInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final errorText = ref.watch(heightErrorMessageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(
          label: '${context.l10n.heightHint} (cm)',
          isRequired: false,
        ),
        const SizedBox(height: Sizes.smallSpacing),
        TextFormField(
          onChanged: notifier.heightChanged,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
