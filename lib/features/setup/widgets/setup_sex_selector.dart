import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/controller/controller.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/bottom_sheet_decorator.dart';

class SetupSexSelector extends ConsumerWidget {
  const SetupSexSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final sex = ref.watch(setupControllerProvider.select((s) => s.sex));

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
            isScrollControlled: true,
            builder: (context) => const _SexWhyBottomSheet(),
          ),
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

class _SexWhyBottomSheet extends HookWidget {
  const _SexWhyBottomSheet();

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    return BottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.medium),
          topRight: Radius.circular(Sizes.medium),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: Sizes.large),
                const BottomSheetDecoration(),
                const SizedBox(height: Sizes.large),
                Text(
                  context.l10n.sexWhy,
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: Sizes.medium),
                SizedBox(
                  height: context.height * 0.5,
                  child: Scrollbar(
                    controller: controller,
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Text(
                        context.l10n.sexWhyDescription,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Sizes.large),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Center(
                    child: Text(
                      context.l10n.goBack,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(
                            color: context.colorScheme.primary,
                          )
                          .underlined(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      onClosing: () {
        Navigator.of(context).pop();
      },
    );
  }
}
