import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineReviewDetailsPage extends StatelessWidget {
  const MedicineReviewDetailsPage({super.key});

  static const String routeName = 'review';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicineReviewDetailsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(context.l10n.medicines),
        actions: [
          CancelButton(
            onConfirm: () => Navigator.of(context)
                .pushAndRemoveUntil(MedicinePage.route(), (route) => false),
          ),
        ],
      ),
      bottomNavigationBar: const _SaveButton(),
      body: const MedicineReviewDetailsView(),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isMedicineReviewValidProvider);
    final isLoading = ref.watch(medicineControllerProvider).isLoading;
    final notifier = ref.watch(medicineFormControllerProvider.notifier);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        boxShadow: boxShadow(context),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.medium),
          child: SizedBox(
            height: Sizes.buttonHeight,
            child: Button(
              isLoading: isLoading,
              isValid: isValid,
              onPressed: notifier.save,
              label: context.l10n.save,
            ),
          ),
        ),
      ),
    );
  }
}

class MedicineReviewDetailsView extends ConsumerWidget {
  const MedicineReviewDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(medicineControllerProvider, (_, state) {
      state.whenOrNull(
        data: (_) => showSnackBar(context, context.l10n.medicineAdded),
        error: (err, _) => showSnackBar(context, err.toString()),
      );
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicineReviewDetails(),
    );
  }
}
