import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/view/view.dart';
import 'package:meddly/features/appointment/widgets/appointment_body.dart';
import 'package:meddly/features/browse/browse.dart';
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(
            '${BrowsePage.routeName}/${AppointmentPage.routeName}/${AppointmentFormPage.routeName}/""',
          );
        },
        tooltip: context.l10n.newAppointment,
        child: const Icon(Icons.add),
      ),
      body: AppointmentBody(controller),
    );
  }
}

class AppointmentTabBar extends HookWidget {
  const AppointmentTabBar(
    this.controller, {
    super.key,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: context.textTheme.titleSmall,
      unselectedLabelStyle: context.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w400,
      ),
      labelColor: context.colorScheme.onBackground,
      indicatorColor: context.colorScheme.primary,
      controller: controller,
      tabs: [
        Tab(
          text: context.l10n.upcomingAppointments,
        ),
        Tab(
          text: context.l10n.pastAppointments,
        ),
      ],
    );
  }
}
