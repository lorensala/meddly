import 'package:flutter/material.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/medicine/controller/medicine_controller.dart';
import 'package:meddly/features/medicine/view/view.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

/// {@template medicine_page}
/// A description for MedicineReviewDetailsPage
/// {@endtemplate}
class MedicineReviewDetailsPage extends StatelessWidget {
  /// {@macro medicine_page}
  const MedicineReviewDetailsPage({super.key});

  /// The static route for MedicineReviewDetailsPage
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

/// {@template medicine_view}
/// Displays the Body of MedicineView
/// {@endtemplate}
class MedicineReviewDetailsView extends ConsumerWidget {
  /// {@macro medicine_view}
  const MedicineReviewDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(medicineControllerProvider, (_, state) {
      state.whenOrNull(
          data: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.medicineAdded),
              ),
            );
            // Navigator.of(context)
            //     .pushAndRemoveUntil(HomeShell, (route) => false);
          },
          error: (err, _) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(err.toString()),
                ),
              ),);
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicineReviewDetails(),
    );
  }
}
