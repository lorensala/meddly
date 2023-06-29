import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';

class PredictionsSymptomsSearchInput extends HookConsumerWidget {
  const PredictionsSymptomsSearchInput({
    this.enabled = true,
    this.onTap,
    super.key,
  });

  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final notifier = ref.watch(symptomSearchControllerProvider.notifier);

    ref.listen(symptomPredictionControllerProvider, (_, state) {
      controller.text = '';
      notifier.queryChanged('');
    });

    useListenable(controller);

    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        style: context.textTheme.bodyMedium,
        enabled: enabled,
        autofocus: enabled,
        controller: controller,
        onChanged: notifier.queryChanged,
        decoration: InputDecoration(
          fillColor: context.colorScheme.secondary,
          hintText: context.l10n.search,
          suffixIcon: controller.value.text.isEmpty
              ? Icon(
                  Icons.search,
                  color: context.colorScheme.surface,
                )
              : IconButton(
                  icon: Icon(
                    Icons.close,
                    color: context.colorScheme.surface,
                  ),
                  onPressed: () {
                    notifier.clear();
                    controller.clear();
                    FocusScope.of(context).unfocus();
                  },
                ),
        ),
      ),
    );
  }
}
