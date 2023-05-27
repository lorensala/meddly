import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineHourPage extends StatelessWidget {
  const MedicineHourPage({super.key});

  static const String routeName = 'hour';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicineHourPage(),
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
      body: const MedicineHourView(),
    );
  }
}

class MedicineHourView extends StatelessWidget {
  const MedicineHourView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicineHourForm(),
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isMedicineStartDateAndHourValidProvider);

    return MedicineNextButton(
      isValid: isValid,
      onPressed: () => ref.read(goRouterProvider).push(
            '${BrowsePage.routeName}/${MedicinePage.routeName}/${MedicineReviewDetailsPage.routeName}',
          ),
    );
  }
}
