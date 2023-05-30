import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/sign_up/sign_up.dart';
import 'package:meddly/l10n/l10n.dart';

class TermsAndConditions extends ConsumerWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signUpControllerProvider.notifier);
    final termsAndConditions = ref.watch(termsAndConditionsProvider);

    return Row(
      children: [
        Checkbox(
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
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      final result = await Navigator.of(context).push<bool>(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) =>
                              const _TermsAndConditionsDialog(),
                        ),
                      );

                      if (result != null && result) {
                        ref
                            .read(signUpControllerProvider.notifier)
                            .onTermsAcceptedChanged(value: true);
                      }
                    },
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

class _TermsAndConditionsDialog extends StatelessWidget {
  const _TermsAndConditionsDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Términos y condiciones'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              context.l10n.accept,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(Sizes.medium),
        child: Text(
          'dsgudagsudgasygd',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
