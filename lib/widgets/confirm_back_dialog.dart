import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/l10n/l10n.dart';

class ConfirmBackDialog extends StatelessWidget {
  const ConfirmBackDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.confirmDiscardChangesTitle),
      content: Text(
        context.l10n.confirmDiscardChangesDescription,
      ),
      actions: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
            GoRouter.of(context).pop();
          },
          child: Text(context.l10n.discardChanges),
        ),
      ],
    );
  }
}
