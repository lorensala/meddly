import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/router.dart';
import 'package:meddly/widgets/widgets.dart';

class MeasurementFormPage extends ConsumerWidget {
  const MeasurementFormPage({super.key});

  static String routeName = 'measurement_form';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.measurements),
        leading: BackButton(
          onPressed: () {
            final form = ref.read(measurementFormControllerProvider);
            final isEditing = ref.read(
              measurementFormControllerProvider
                  .select((value) => value.isEditing),
            );

            if (!isEditing) {
              return ref.read(goRouterProvider).pop();
            }

            if (form.isDirty) {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return const ConfirmDiscardDialog();
                },
              );
            } else {
              ref.read(goRouterProvider).pop();
            }
          },
        ),
      ),
      bottomNavigationBar: ColoredBox(
        color: context.colorScheme.secondary,
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Sizes.medium),
            child: SizedBox(
              height: Sizes.buttonHeight,
              child: _SaveButton(),
            ),
          ),
        ),
      ),
      body: const MeasurementForm(),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(
      measurementFormControllerProvider.select(
        (value) => value.isEditing,
      ),
    );
    final isLoading = ref.watch(
      measurementControllerProvider.select(
        (value) => value.isLoading,
      ),
    );
    final isValid = ref.watch(measurementIsValidProvider) && !isLoading;

    return Button(
      isValid: isValid,
      onPressed: () {
        if (isEditing) {
          ref.read(measurementFormControllerProvider.notifier).save();
        } else {
          ref.read(measurementFormControllerProvider.notifier).edit();
        }
      },
      label: isEditing ? context.l10n.save : context.l10n.editMeasurement,
    );
  }
}
