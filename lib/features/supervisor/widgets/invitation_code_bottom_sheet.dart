import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

MaskTextInputFormatter codeMaskFormatter = MaskTextInputFormatter(
  mask: "###-####-###'",
  filter: {'#': RegExp('[A-Z0-9]')},
);

class InvitationCodeBottomSheet extends HookConsumerWidget {
  const InvitationCodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetDecoration(),
            const SizedBox(height: Sizes.medium),
            Text(
              context.l10n.enterSupervisorCode,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: Sizes.medium),
            SizedBox(
              width: context.width * 0.7,
              child: TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
                textAlign: TextAlign.center,
                controller: controller,
                inputFormatters: [
                  codeMaskFormatter,
                  UpperCaseTextFormatter(),
                  LengthLimitingTextInputFormatter(12),
                ],
                style: context.textTheme.titleLarge,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      await Clipboard.getData('text/plain').then((value) {
                        if (value?.text != null) {
                          controller.text = value!.text!;
                          ref
                              .read(
                                supervisorCodeFormControllerProvider.notifier,
                              )
                              .codeChanged(value.text!);
                        }
                      });
                    },
                    child: const Icon(Icons.paste_rounded),
                  ),
                  suffixIconColor:
                      context.colorScheme.onSecondary.withOpacity(0.4),
                  hintText: 'L0R-3NZ0-S4L',
                  hintStyle: context.textTheme.titleLarge!.copyWith(
                    color: context.colorScheme.onSecondary.withOpacity(0.4),
                  ),
                ),
                onChanged: (value) => ref
                    .read(supervisorCodeFormControllerProvider.notifier)
                    .codeChanged(value),
              ),
            ),
            const SizedBox(height: Sizes.large),
            Button(
              isValid: ref.watch(supervisorCodeFormControllerProvider).isValid,
              isLoading: ref.watch(supervisorControllerProvider).isLoading,
              onPressed: () {
                ref
                    .read(supervisorCodeFormControllerProvider.notifier)
                    .submit();
                GoRouter.of(context).pop();
              },
              label: context.l10n.accept,
            ),
            const SizedBox(height: Sizes.medium),
          ],
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
