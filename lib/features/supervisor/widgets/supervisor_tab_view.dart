import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/supervisor/widgets/widgets.dart';
import 'package:meddly/l10n/l10n.dart';

class SupervisorTabView extends HookWidget {
  const SupervisorTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 2);

    return Expanded(
      child: Column(
        children: [
          DecoratedBox(
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
              controller: controller,
              labelStyle: context.textTheme.titleSmall,
              unselectedLabelStyle: context.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400,
              ),
              labelColor: context.colorScheme.onBackground,
              indicatorColor: context.colorScheme.primary,
              tabs: [
                Tab(text: context.l10n.supervised),
                Tab(text: context.l10n.supervisors),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: const [
                SupervisedList(),
                SupervisorsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
