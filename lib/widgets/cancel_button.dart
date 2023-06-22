import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/router.dart';

class CancelButton extends ConsumerWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        await showDialog<void>(
          context: context,
          builder: (_) {
            return ProviderScope(
              parent: ProviderScope.containerOf(context),
              child: AlertDialog(
                title: Text(
                  context.l10n.confirmDiscardChangesTitle,
                  style: context.textTheme.titleLarge,
                ),
                content: Text(
                  context.l10n.confirmDiscardChangesDescription,
                  style: context.textTheme.bodyMedium,
                ),
                actions: [
                  TextButton(
                    onPressed: () => ref.read(goRouterProvider).pop(),
                    child: Text(context.l10n.cancel),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(goRouterProvider).pop();
                      ref.read(goRouterProvider).go(HomePage.routeName);
                    },
                    child: Text(
                      context.l10n.discardChanges,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Center(
          child: Text(
            context.l10n.cancel,
            style: context.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
