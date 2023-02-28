import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/controller/medicine_form_controller.dart';
import 'package:meddly/features/medicine/core/utils.dart';
import 'package:meddly/features/medicine/view/medicine_review_details_page.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

import '../provider/provider.dart';

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

class _NextButton extends ConsumerWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isMedicineFrecuencyAndHoursValidProvider);

    return Button(
      isValid: isValid,
      onPressed: () => Navigator.of(context).push(
        MedicineReviewDetailsPage.route(),
      ),
      label: context.l10n.next,
    );
  }
}

class _HourSelector extends ConsumerWidget {
  const _HourSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFrecuency = ref.watch(medicineFrecuencyProvider);
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final selectedHours = ref.watch(medicineHoursProvider);

    if (selectedFrecuency == MedicineFrecuency.asNeeded) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        InputLabel(
          label: context.l10n.selectTheHoursYouWantToTakeThisMedicine,
          isRequired: true,
        ),
        const SizedBox(height: Sizes.smallSpacing),
        SizedBox(
          width: MediaQuery.of(context).size.width,
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
                            onPrimary: context.colorScheme.onPrimary,
                            secondary: context.colorScheme.secondary,
                            onSecondary: context.colorScheme.onSecondary,
                            surface: context.colorScheme.secondary,
                            onSurface: context.colorScheme.onSurface,
                            background: context.colorScheme.background,
                            onBackground: context.colorScheme.onBackground,
                            error: context.colorScheme.error,
                            onError: context.colorScheme.onError,
                            brightness: context.colorScheme.brightness,
                          ),
                        ),
                        child: child!,
                      );
                    },
                    initialTime: const TimeOfDay(hour: 0, minute: 0),
                  );

                  if (hour != null) {
                    notifier.hoursChanged(
                      {...selectedHours, hour}.toList(),
                    );
                  }
                },
                child: Chip(
                  backgroundColor: context.colorScheme.secondary,
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add),
                      Text(context.l10n.addHour),
                    ],
                  ),
                ),
              ),
              for (final hour in selectedHours)
                Chip(
                  backgroundColor: context.colorScheme.secondary,
                  label: Text(hour.format(context)),
                  onDeleted: () {
                    notifier.hoursChanged(
                      {...selectedHours}.toList()..remove(hour),
                    );
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StartDateSelector extends ConsumerWidget {
  const _StartDateSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFrequency =
        ref.watch(medicineFormControllerProvider).frecuency;

    if (selectedFrequency == MedicineFrecuency.asNeeded) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(
          label: context.l10n.startDate,
          isRequired: true,
        ),
        const SizedBox(height: Sizes.smallSpacing),
        _StartDateInput(),
      ],
    );
  }
}

class _IntervalSelector extends ConsumerWidget {
  const _IntervalSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFrecuency =
        ref.watch(medicineFormControllerProvider).frecuency;

    return selectedFrecuency == MedicineFrecuency.asNeeded
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
  }
}

class _IntervalBody extends HookConsumerWidget {
  const _IntervalBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFrequency =
        ref.watch(medicineFormControllerProvider).frecuency;
    final selectedFrecuencValue = ref.watch(medicineFrecuencyValueProvider);
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final selectedDays = ref.watch(medicineDaysProvider);

    final List<DropdownMenuItem<int>> items = useMemoized(() => [
          for (var i = 1; i <= 100; i++)
            DropdownMenuItem(
              value: i,
              child: Text(i.toDaysString()),
            ),
        ]);

    switch (selectedFrequency) {
      case MedicineFrecuency.regular:
        return Row(
          children: [
            Text(
              context.l10n.every,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(width: Sizes.mediumSpacing),
            DropDownSelector<int>(
              items: items,
              onChanged: (value) {
                notifier.frecuencyValueChanged(value);
              },
              value: selectedFrecuencValue,
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
                          onTap: () => notifier.daysChanged(day),
                          child: CircleAvatar(
                            backgroundColor: selectedDays.contains(day)
                                ? context.colorScheme.primary
                                : context.colorScheme.secondary,
                            child: Text(
                              day.name.substring(0, 1).toUpperCase(),
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: selectedDays.contains(day)
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
                  selectedDays.isEmpty
                      ? context.l10n.selectAtLeastOneDay
                      : '${context.l10n.everyX(selectedDays.map((e) => e.name).join(', '))}.',
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: selectedDays.isEmpty
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
  }
}

class _FrecuencySelector extends ConsumerWidget {
  const _FrecuencySelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final selectedFrecuency = ref.watch(medicineFrecuencyProvider);

    return DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(Sizes.borderRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: MedicineFrecuency.values
              .map(
                (frecuency) => ListTile(
                  title: Text(getl10nFrecuency(frecuency, context)),
                  trailing: selectedFrecuency == frecuency
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () => notifier.frecuencyChanged(frecuency),
                ),
              )
              .toList(),
        ));
  }
}

class _StartDateInput extends ConsumerWidget {
  const _StartDateInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    return DateSelector(
        initialDateTime: DateTime.now(),
        onDateTimeChanged: (value) {
          notifier.startDateChanged(value);
        },
        errorText: null);
  }
}
