import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    required this.onConfirm,
    super.key,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showConfirmationDialog(
          context,
          onConfirm,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Center(
          child: Text(
            context.l10n.cancel,
            style: context.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
