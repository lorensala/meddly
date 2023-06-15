import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

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
            'Cancel',
            style: context.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
