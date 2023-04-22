import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/sign_up/sign_up.dart';
import 'package:meddly/l10n/l10n.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer(
          builder: (context, ref, _) {
            final notifier = ref.watch(signUpControllerProvider.notifier);
            final termsAndConditions = ref.watch(termsAndConditionsProvider);
            return Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              activeColor: context.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              value: termsAndConditions.value,
              onChanged: (bool? value) {
                HapticFeedback.lightImpact();
                notifier.onTermsAcceptedChanged(value: value!);
              },
            );
          },
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${context.l10n.accept} ',
                  style: context.textTheme.bodyMedium,
                ),
                TextSpan(
                  text: context.l10n.termsAndConditions,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
