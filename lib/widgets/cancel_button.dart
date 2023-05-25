import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    required this.onConfirm,
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
        padding: Sizes.mediumPadding,
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
