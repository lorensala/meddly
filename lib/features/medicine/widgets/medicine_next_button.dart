import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineNextButton extends ConsumerWidget {
  const MedicineNextButton({
    required this.isValid,
    required this.onPressed,
    super.key,
  });

  final bool isValid;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        boxShadow: Constants.boxShadow,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.medium),
          child: FittedBox(
            child: Button(
              isValid: isValid,
              onPressed: onPressed,
              label: context.l10n.next,
            ),
          ),
        ),
      ),
    );
  }
}
