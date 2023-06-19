import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/router/router.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineDosisPage extends StatelessWidget {
  const MedicineDosisPage({super.key});

  static const String routeName = 'dosis';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicineDosisPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          CancelButton(
            onConfirm: () => Navigator.of(context)
                .pushAndRemoveUntil(MedicinePage.route(), (route) => false),
          ),
        ],
      ),
      bottomNavigationBar: const _NextButton(),
      body: const MedicineDosisView(),
    );
  }
}

class MedicineDosisView extends StatelessWidget {
  const MedicineDosisView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const MedicineDosisForm(),
      ),
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isMedicineDosisValidProvider);

    return MedicineNextButton(
      isValid: isValid,
      onPressed: () {
        ref.read(goRouterProvider).push(
              '/${MedicineFrecuencyPage.routeName}',
            );
      },
    );
  }
}
