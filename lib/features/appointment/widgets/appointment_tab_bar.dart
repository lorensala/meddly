import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';

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
