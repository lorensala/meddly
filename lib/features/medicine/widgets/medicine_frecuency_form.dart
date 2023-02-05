import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedicineFrecuencyForm extends StatelessWidget {
  const MedicineFrecuencyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _FrecuencySelector(),
          const SizedBox(height: Sizes.mediumSpacing),
          const _IntervalSelector(),
          const SizedBox(height: Sizes.mediumSpacing),
          const _StartDateSelector(),
          const SizedBox(height: Sizes.mediumSpacing),
          Button(onPressed: () {}, label: 'Next'),
        ],
      ),
    );
  }
}

class _StartDateSelector extends StatelessWidget {
  const _StartDateSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      builder: (context, state) {
        return state.frecuency != MedicineFrecuency.asNeeded
            ? DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(Sizes.borderRadius),
                ),
                child: const Padding(
                  padding: Sizes.padding,
                  child: _BirthdateInput(),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _IntervalSelector extends StatelessWidget {
  const _IntervalSelector();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
      ),
      child: BlocBuilder<MedicineFormCubit, MedicineFormState>(
        buildWhen: (previous, current) =>
            previous.frecuency != current.frecuency ||
            previous.days != current.days ||
            previous.frecuencyValue != current.frecuencyValue,
        builder: (context, state) {
          switch (state.frecuency) {
            case MedicineFrecuency.regular:
              return Padding(
                padding: Sizes.horizontalPadding,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: state.frecuencyValue,
                    items: [
                      for (var i = 1; i <= 100; i++)
                        DropdownMenuItem(
                          value: i,
                          child: Text(i.toDaysString()),
                        ),
                    ],
                    onChanged: cubit.frecuencyValueChanged,
                  ),
                ),
              );
            case MedicineFrecuency.specificDays:
              return Padding(
                padding: Sizes.padding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: MedicineDay.values
                          .map(
                            (day) => GestureDetector(
                              onTap: () => cubit.daysChanged(day),
                              child: CircleAvatar(
                                backgroundColor: cubit.state.days.contains(day)
                                    ? context.colorScheme.primary
                                    : context.colorScheme.secondary,
                                child: Text(
                                  day.name.substring(0, 1),
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    color: cubit.state.days.contains(day)
                                        ? context.colorScheme.onPrimary
                                        : context.colorScheme.onSecondary,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: Sizes.mediumSpacing),
                    Text(
                      cubit.state.days.isEmpty
                          ? 'Select at least one day'
                          : 'Every ${cubit.state.days.map((e) => e.name).join(', ')}.',
                    )
                  ],
                ),
              );
            case MedicineFrecuency.asNeeded:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _FrecuencySelector extends StatelessWidget {
  const _FrecuencySelector();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
      ),
      child: BlocBuilder<MedicineFormCubit, MedicineFormState>(
        buildWhen: (previous, current) =>
            previous.frecuency != current.frecuency,
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: MedicineFrecuency.values
                .map(
                  (frecuency) => ListTile(
                    title: Text(frecuency.name.capitalize()),
                    trailing: cubit.state.frecuency == frecuency
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () => cubit.frecuencyChanged(frecuency),
                  ),
                )
                .toList(),
          );
        },
      ),
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
    _controller.text = DateTime.now().toString().dateTimeStringFormat;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      buildWhen: (previous, current) => previous.startDate != current.startDate,
      builder: (context, state) {
        final initialDateTime = state.startDate ?? DateTime.now();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const InputLabel(
              label: 'Start date',
              isRequired: true,
            ),
            const SizedBox(width: Sizes.mediumSpacing),
            Expanded(
              child: TextFormField(
                controller: _controller,
                onTap: () async {
                  if (Platform.isAndroid) {
                    // show Adnroid date picker
                    await showDatePicker(
                      context: context,
                      initialDate: initialDateTime,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      if (value != null) {
                        _controller.text =
                            value.toString().dateTimeStringFormat;
                        context
                            .read<MedicineFormCubit>()
                            .startDateChanged(value);
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
                                  // initialDateTime: initialDateTime,
                                  minimumDate: DateTime.now(),
                                  maximumDate: DateTime(2100),
                                  onDateTimeChanged: (value) {
                                    _controller.text =
                                        value.toString().dateTimeStringFormat;
                                    context
                                        .read<MedicineFormCubit>()
                                        .startDateChanged(value);
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
              ),
            ),
          ],
        );
      },
    );
  }
}
