import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/cubit/cubit.dart';
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
          _CreateAccountButton()
        ],
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetupCubit>();
    return BlocBuilder<SetupCubit, SetupState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.requiredFieldsAreValid != current.requiredFieldsAreValid,
      builder: (context, state) {
        return Button(
          isValid: state.requiredFieldsAreValid,
          isLoading: state.status.isSubmissionInProgress,
          onPressed: cubit.createAccount,
          label: context.l10n.createAccount,
        );
      },
    );
  }
}

class _SexSelector extends StatelessWidget {
  const _SexSelector();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetupCubit>();
    return BlocBuilder<SetupCubit, SetupState>(
      buildWhen: (previous, current) => previous.sex != current.sex,
      builder: (context, state) {
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
                  groupValue: state.sex.value,
                  onChanged: (value) => cubit.sexChanged(value: value!),
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
                  groupValue: state.sex.value,
                  onChanged: (value) => cubit.sexChanged(value: value!),
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
      },
    );
  }
}

class _BirthdateInput extends StatefulWidget {
  const _BirthdateInput();

  @override
  State<_BirthdateInput> createState() => _BirthdateInputState();
}

class _BirthdateInputState extends State<_BirthdateInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupState>(
      buildWhen: (previous, current) => previous.birthdate != current.birthdate,
      builder: (context, state) {
        final initialDateTime =
            DateTime.tryParse(state.birthdate.value) ?? DateTime.now();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputLabel(
              label: context.l10n.birthdateHint,
              isRequired: true,
            ),
            const SizedBox(height: Sizes.smallSpacing),
            TextFormField(
              controller: _controller,
              onTap: () async {
                if (Platform.isAndroid) {
                  // show Adnroid date picker
                  await showDatePicker(
                    context: context,
                    initialDate: initialDateTime,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      _controller.text =
                          value.toString().dateTimeStringFormat();
                      context
                          .read<SetupCubit>()
                          .birthdateChanged(value.toString());
                    }
                  });
                } else {
                  // show iOS date selector
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
                                  _controller.text =
                                      value.toString().dateTimeStringFormat();
                                  context
                                      .read<SetupCubit>()
                                      .birthdateChanged(value.toString());
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
                errorText: !state.birthdate.pure
                    ? state.birthdate.error?.when(
                        invalid: () => context.l10n.invalidBirthdate,
                        empty: () => context.l10n.birthdateEmpty,
                        underage: () => context.l10n.birthdateUnderage,
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SetupCubit>();
    return BlocBuilder<SetupCubit, SetupState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputLabel(label: context.l10n.nameHint, isRequired: true),
            const SizedBox(height: Sizes.smallSpacing),
            TextFormField(
              onChanged: cubit.nameChanged,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                errorText: !state.name.pure
                    ? state.name.error?.when(
                        invalid: () => context.l10n.invalidName,
                        tooLong: () => context.l10n.nameTooLong,
                        empty: () => context.l10n.nameEmpty,
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LastnameInput extends StatelessWidget {
  const _LastnameInput();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SetupCubit>();
    return BlocBuilder<SetupCubit, SetupState>(
      buildWhen: (previous, current) => previous.lastname != current.lastname,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputLabel(label: context.l10n.lastNameHint, isRequired: true),
            const SizedBox(height: Sizes.smallSpacing),
            TextFormField(
              onChanged: cubit.lastnameChanged,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                errorText: !state.lastname.pure
                    ? state.lastname.error?.when(
                        invalid: () => context.l10n.invalidLastName,
                        tooLong: () => context.l10n.lastNameTooLong,
                        empty: () => context.l10n.lastNameEmpty,
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _WeightInput extends StatelessWidget {
  const _WeightInput();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SetupCubit>();
    return BlocBuilder<SetupCubit, SetupState>(
      buildWhen: (previous, current) => previous.weight != current.weight,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputLabel(
              label: '${context.l10n.weightHint} (kg)',
              isRequired: false,
            ),
            const SizedBox(height: Sizes.smallSpacing),
            TextFormField(
              onChanged: cubit.weightChanged,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                errorText: !state.weight.pure
                    ? state.weight.error?.when(
                        invalid: () => context.l10n.invalidWeight,
                        empty: () => context.l10n.weightEmpty,
                        negative: () => context.l10n.weightNegative,
                        zero: () => context.l10n.weightZero,
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HeightInput extends StatelessWidget {
  const _HeightInput();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SetupCubit>();
    return BlocBuilder<SetupCubit, SetupState>(
      buildWhen: (previous, current) => previous.height != current.height,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputLabel(
              label: '${context.l10n.heightHint} (cm)',
              isRequired: false,
            ),
            const SizedBox(height: Sizes.smallSpacing),
            TextFormField(
              onChanged: cubit.heightChanged,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                errorText: !state.height.pure
                    ? state.height.error?.when(
                        invalid: () => context.l10n.invalidHeight,
                        empty: () => context.l10n.heightEmpty,
                        negative: () => context.l10n.heightNegative,
                        zero: () => context.l10n.heightZero,
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
