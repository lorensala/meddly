import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/l10n/l10n.dart';

class SupervisorPage extends StatelessWidget {
  const SupervisorPage({super.key});

  static const routeName = 'supervisor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.linkedAccounts),
      ),
      body: const SupervisorBody(),
    );
  }
}

class SupervisorBody extends ConsumerWidget {
  const SupervisorBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SupervisorCode(),
        const SizedBox(height: Sizes.medium),
        const SupervisorShareCode(),
        const SizedBox(height: Sizes.medium),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
          child: Text(
            context.l10n.supervisorCodeDescription,
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.onBackground.withOpacity(0.5),
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(height: Sizes.large),
        const SupervisorTabView()
      ],
    );
  }
}
