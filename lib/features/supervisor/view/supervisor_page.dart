import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/widgets/widgets.dart';

class SupervisorPage extends StatelessWidget {
  const SupervisorPage({super.key});

  static const routeName = 'supervisor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supervisor'),
      ),
      body: const SupervisorBody(),
    );
  }
}

class SupervisorBody extends ConsumerWidget {
  const SupervisorBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      supervisorControllerProvider,
      (_, state) => state.whenOrNull(
        error: (err, _) => showSnackBar(context, err.toString()),
      ),
    );

    final res = ref.watch(supervisorControllerProvider);

    return AsyncValueWidget(
      value: res,
      builder: (res) {
        return Column(
          children: [
            const Text('Supervisados'),
            ListView.builder(
              itemCount: res.supervised.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(res.supervised[index].firstName),
                  subtitle: Text(res.supervised[index].email),
                );
              },
            ),
            const Text('Supervisores'),
            ListView.builder(
              itemCount: res.supervisors.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(res.supervisors[index].firstName),
                  subtitle: Text(res.supervisors[index].email),
                );
              },
            ),
            const SizedBox(height: Sizes.large),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(supervisorControllerProvider.notifier)
                    .acceptInvitation('QKZ-WDCC-DBH');
              },
              child: const Text('Agregar supervisor'),
            ),
          ],
        );
      },
    );
  }
}
