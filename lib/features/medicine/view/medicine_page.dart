import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';

class MedicinePage extends HookWidget {
  const MedicinePage({super.key});

  static const String routeName = 'medicine';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MedicinePage());
  }

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 3);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(context.l10n.medicines),
        actions: const [
          MedicineFilter(),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: MedicineTabBar(controller: controller),
        ),
      ),
      body: MedicineTabView(controller: controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go(
            '${BrowsePage.routeName}/${MedicinePage.routeName}/${MedicineNamePage.routeName}',
          );
        },
        tooltip: context.l10n.newMedicine,
        child: const Icon(Icons.add),
      ),
    );
  }
}
