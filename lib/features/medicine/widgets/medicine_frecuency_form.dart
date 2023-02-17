import 'dart:io' show Platform;

import 'package:calendar/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/core/utils.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/features/medicine/view/medicine_review_details_page.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineFrecuencyForm extends StatelessWidget {
  const MedicineFrecuencyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Sizes.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputLabel(
              label: context.l10n.howOftenDoYouWantToTakeThisMedicine,
              isRequired: false,
            ),
            const SizedBox(height: Sizes.smallSpacing),
            const _FrecuencySelector(),
            const SizedBox(height: Sizes.mediumSpacing),
            const _IntervalSelector(),
            const SizedBox(height: Sizes.mediumSpacing),
            const _StartDateSelector(),
            const SizedBox(height: Sizes.mediumSpacing),
            const _HourSelector(),
            const SizedBox(height: Sizes.mediumSpacing),
            const _NextButton(),
            const SizedBox(height: Sizes.largeSpacing),
          ],
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      builder: (context, state) {
        return Button(
          isValid: state.isFrecuencyValid,
          onPressed: () => Navigator.of(context).push(
            MedicineReviewDetailsPage.route(
              context.read<MedicineFormCubit>(),
            ),
          ),
          label: context.l10n.next,
        );
      },
    );
  }
}

class _HourSelector extends StatelessWidget {
  const _HourSelector();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      builder: (context, state) {
        return state.frecuency != MedicineFrecuency.asNeeded
            ? Column(
                children: [
                  InputLabel(
                    label: context.l10n.selectTheHoursYouWantToTakeThisMedicine,
                    isRequired: false,
                  ),
                  const SizedBox(height: Sizes.smallSpacing),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(Sizes.borderRadius),
                      ),
                      child: Padding(
                        padding: Sizes.padding,
                        child: Wrap(
                          spacing: Sizes.smallSpacing,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final hour = await showTimePicker(
                                  context: context,
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: context.colorScheme.primary,
                                          onPrimary:
                                              context.colorScheme.onPrimary,
                                          secondary:
                                              context.colorScheme.secondary,
                                          onSecondary:
                                              context.colorScheme.onSecondary,
                                          surface:
                                              context.colorScheme.secondary,
                                          onSurface:
                                              context.colorScheme.onSurface,
                                          background:
                                              context.colorScheme.background,
                                          onBackground:
                                              context.colorScheme.onBackground,
                                          error: context.colorScheme.error,
                                          onError: context.colorScheme.onError,
                                          brightness:
                                              context.colorScheme.brightness,
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  initialTime:
                                      const TimeOfDay(hour: 0, minute: 0),
                                );

                                if (hour != null) {
                                  cubit.hoursChanged(
                                    {...state.hours, hour}.toList(),
                                  );
                                }
                              },
                              child: Chip(
                                backgroundColor: context.colorScheme.background,
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.add),
                                    Text(context.l10n.addHour),
                                  ],
                                ),
                              ),
                            ),
                            for (final hour in state.hours)
                              Chip(
                                backgroundColor: context.colorScheme.background,
                                label: Text(hour.format(context)),
                                onDeleted: () {
                                  cubit.hoursChanged(
                                    {...state.hours}.toList()..remove(hour),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
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
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputLabel(
                    label: context.l10n.startDate,
                    isRequired: true,
                  ),
                  const SizedBox(height: Sizes.smallSpacing),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(Sizes.borderRadius),
                    ),
                    child: const Padding(
                      padding: Sizes.padding,
                      child: _StartDateInput(),
                    ),
                  ),
                ],
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
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      buildWhen: (previous, current) => previous.frecuency != current.frecuency,
      builder: (context, state) {
        return state.frecuency == MedicineFrecuency.asNeeded
            ? const SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputLabel(
                    label: context.l10n.chooseTheIntervalBetweenDoses,
                    isRequired: false,
                  ),
                  const SizedBox(height: Sizes.smallSpacing),
                  const _IntervalBody(),
                ],
              );
      },
    );
  }
}

class _IntervalBody extends StatelessWidget {
  const _IntervalBody();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      buildWhen: (previous, current) =>
          previous.frecuency != current.frecuency ||
          previous.days != current.days ||
          previous.frecuencyValue != current.frecuencyValue,
      builder: (context, state) {
        switch (state.frecuency) {
          case MedicineFrecuency.regular:
            return Row(
              children: [
                Text(
                  context.l10n.every,
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(width: Sizes.mediumSpacing),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(Sizes.borderRadius),
                  ),
                  child: Padding(
                    padding: Sizes.horizontalPadding,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        borderRadius: BorderRadius.circular(Sizes.borderRadius),
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
                  ),
                ),
              ],
            );
          case MedicineFrecuency.specificDays:
            return DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(Sizes.borderRadius),
              ),
              child: Padding(
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
                                  day.name.substring(0, 1).toUpperCase(),
                                  style: context.textTheme.bodyMedium!.copyWith(
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
                          ? context.l10n.selectAtLeastOneDay
                          : '${context.l10n.everyX(cubit.state.days.map((e) => e.name).join(', '))}.',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: cubit.state.days.isEmpty
                            ? context.colorScheme.error
                            : context.colorScheme.onSecondary.withOpacity(0.7),
                      ),
                    )
                  ],
                ),
              ),
            );
          case MedicineFrecuency.asNeeded:
            return const SizedBox.shrink();
          // ignore: no_default_cases
          default:
            return const SizedBox.shrink();
        }
      },
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
                    title: Text(getl10nFrecuency(frecuency, context)),
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

class _StartDateInput extends StatefulWidget {
  const _StartDateInput();

  @override
  State<_StartDateInput> createState() => _StartDateInputState();
}

class _StartDateInputState extends State<_StartDateInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = DateTime.now().toString().dateTimeStringFormat();
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
                            value.toString().dateTimeStringFormat();
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
                                        value.toString().dateTimeStringFormat();
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
