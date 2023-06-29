import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/router.dart';

class ConfirmDiscardDialog extends ConsumerWidget {
  const ConfirmDiscardDialog({
    this.onDiscard,
    super.key,
  });

  final VoidCallback? onDiscard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
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
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();

            onDiscard != null ? onDiscard!() : ref.read(goRouterProvider).pop();
          },
          child: Text(
            context.l10n.discardChanges,
          ),
        ),
      ],
    );
  }
}
