import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';

class AppointmentPage extends HookWidget {
  const AppointmentPage({super.key});

  static String routeName = 'appointment';

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 2);

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: context.colorScheme.onBackground.withOpacity(0.2),
        title: Text(context.l10n.appointments),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppointmentTabBar(controller),
        ),
        actions: const [
          AppointmentFilter(),
        ],
      ),
      body: AppointmentBody(controller),
    );
  }
}
