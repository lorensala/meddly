import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';

class MedicineTabBar extends StatelessWidget {
  const MedicineTabBar({
    required this.controller,
    super.key,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onBackground.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TabBar(
        indicatorColor: context.colorScheme.primary,
        controller: controller,
        tabs: [
          Tab(
            text: context.l10n.active,
          ),
          Tab(
            text: context.l10n.archived,
          ),
        ],
      ),
    );
  }
}
