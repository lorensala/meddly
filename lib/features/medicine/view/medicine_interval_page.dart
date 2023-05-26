import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/router/router.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedicineIntervalPage extends StatelessWidget {
  const MedicineIntervalPage({super.key});

  static const String routeName = 'interval';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicineIntervalPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Medicine'),
        actions: [
          CancelButton(
            onConfirm: () => Navigator.of(context)
                .pushAndRemoveUntil(MedicinePage.route(), (route) => false),
          ),
        ],
      ),
      bottomNavigationBar: const _NextButton(),
      body: const MedicineIntervalView(),
    );
  }
}

class MedicineIntervalView extends StatelessWidget {
  const MedicineIntervalView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicineIntervalForm(),
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAsNeeded = ref.watch(
          medicineFormControllerProvider.select((value) => value.frecuency),
        ) ==
        MedicineFrecuency.asNeeded;
    final isValid = ref.watch(isMedicineFrecuencyValidProvider);

    return MedicineNextButton(
      isValid: isValid,
      onPressed: () {
        if (isAsNeeded) {
          ref.read(goRouterProvider).push(MedicineReviewDetailsPage.routeName);
        } else {
          ref.read(goRouterProvider).push(MedicineHourPage.routeName);
        }
      },
    );
  }
}
