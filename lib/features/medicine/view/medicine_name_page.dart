import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';

class MedicineNamePage extends StatelessWidget {
  const MedicineNamePage({super.key});

  static const String routeName = 'name';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MedicineNamePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.medicines),
      ),
      body: const MedicineNameView(),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const _NextButton(),
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isMedicineNameValidProvider);
    ref.watch(medicineControllerProvider);

    return MedicineNextButton(
      isValid: isValid,
      onPressed: () {
        ref.read(goRouterProvider).push(
              '/${MedicinePresentationPage.routeName}',
            );
      },
    );
  }
}

class MedicineNameView extends StatelessWidget {
  const MedicineNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicineNameForm(),
    );
  }
}
