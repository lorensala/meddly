import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/controller/controller.dart';
import 'package:meddly/features/setup/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class SetupSexSelector extends ConsumerWidget {
  const SetupSexSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final sex = ref.watch(setupSexProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: sex.value,
              onChanged: (value) => notifier.sexChanged(value: value!),
            ),
            Text(
              context.l10n.male,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
        Row(
          children: [
            Radio<bool>(
              value: false,
              groupValue: sex.value,
              onChanged: (value) => notifier.sexChanged(value: value!),
            ),
            Text(
              context.l10n.female,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
        InputDescription(
          description: context.l10n.sexDescription,
        ),
        const SizedBox(height: Sizes.medium),
        GestureDetector(
          // TODO: Make this a route or an alert dialog...
          //onTap: () => Navigator.push(context, route),
          child: Text(
            context.l10n.sexWhy,
            style: TextStyle(
              color: context.colorScheme.primary,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
            ),
          ),
        )
      ],
    );
  }
}
