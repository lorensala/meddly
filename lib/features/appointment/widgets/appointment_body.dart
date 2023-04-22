import 'package:flutter/material.dart';
import 'package:meddly/features/appointment/provider/provider.dart';

/// {@template appointment_body}
/// Body of the AppointmentPage.
///
/// Add what it does
/// {@endtemplate}
class AppointmentBody extends ConsumerWidget {
  /// {@macro appointment_body}
  const AppointmentBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(appointmentProvider);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('You have pushed the button this many times: $count'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(appointmentProvider.notifier).increment(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),);
  }
}
