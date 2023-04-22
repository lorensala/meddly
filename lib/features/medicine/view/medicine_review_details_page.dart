import 'package:flutter/material.dart';
import 'package:meddly/core/helpers.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/medicine/controller/medicine_controller.dart';
import 'package:meddly/features/medicine/view/view.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineReviewDetailsPage extends StatelessWidget {
  const MedicineReviewDetailsPage({super.key});

  static const String routeName = '/medicine/review';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicineReviewDetailsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine'),
        actions: [
          CancelButton(
            onConfirm: () => Navigator.of(context)
                .pushAndRemoveUntil(MedicinePage.route(), (route) => false),
          ),
        ],
      ),
      body: const MedicineReviewDetailsView(),
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
