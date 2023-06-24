import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';

class SetupBirthdateInput extends HookConsumerWidget {
  const SetupBirthdateInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final birthdate =
        ref.watch(setupControllerProvider.select((value) => value.birthdate));
    final errorText = ref.watch(birthdateErrorMessageProvider);

    final now = DateTime.now();

    final controller = useTextEditingController(text: birthdate.value);

    ref.listen(setupControllerProvider, (_, state) {
      controller.text = state.birthdate.value.dateTimeStringFormat();
    });

    return TextFormField(
      readOnly: true,
      controller: controller,
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: context.l10n.selectADate,
      ),
      onTap: () async {
        final date = await showAdaptiveDatePicker(
          context: context,
          initialDateTime: DateTime(
            now.year,
            now.month,
            now.day,
          ),
          lastDate: DateTime(
            now.year,
            now.month,
            now.day,
          ),
        );
        if (date != null) {
          notifier.birthdateChanged(date.toString());
        }
      },
      keyboardType: TextInputType.number,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
    );
  }
}
