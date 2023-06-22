import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';

class ConfirmBackDialog extends ConsumerWidget {
  const ConfirmBackDialog({
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });

  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

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
          onPressed: onConfirm == null
              ? () => ref.read(goRouterProvider).pop()
              : () => onConfirm!(),
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: onCancel ??
              () {
                ref.read(goRouterProvider).pop();
                ref.read(goRouterProvider).pop();
              },
          child: Text(
            context.l10n.discardChanges,
          ),
        ),
      ],
    );
  }
}
