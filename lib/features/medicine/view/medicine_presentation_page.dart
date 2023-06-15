import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicinePresentationPage extends StatelessWidget {
  const MedicinePresentationPage({super.key});

  static const String routeName = 'presentation';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicinePresentationPage(),
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
      body: const MedicinePresentationView(),
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MedicineNextButton(
      isValid: true,
      onPressed: () => ref.read(goRouterProvider).push(
          '${BrowsePage.routeName}/${MedicinePage.routeName}/${MedicineDosisPage.routeName}',),
    );
  }
}

class MedicinePresentationView extends StatelessWidget {
  const MedicinePresentationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const MedicinePresentationForm(),
      ),
    );
  }
}
