import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/controller/controller.dart';
import 'package:meddly/features/setup/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';

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
        const SizedBox(height: Sizes.medium),
        GestureDetector(
          onTap: () => showModalBottomSheet<void>(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => BottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Sizes.medium),
                        topRight: Radius.circular(Sizes.medium),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(Sizes.medium),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: Sizes.large),
                              Text(
                                context.l10n.sexWhy,
                                style: context.textTheme.titleMedium,
                              ),
                              const SizedBox(height: Sizes.medium),
                              Text(
                                context.l10n.sexWhyDescription,
                                style: context.textTheme.bodyMedium,
                              ),
                              const SizedBox(height: Sizes.large),
                            ],
                          ),
                        ),
                      );
                    },
                    onClosing: () {
                      Navigator.of(context).pop();
                    },
                  )),
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
