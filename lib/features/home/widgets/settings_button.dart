import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/user/user.dart';

class SettingsButton extends ConsumerWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.watch(userControllerProvider.notifier).signOut(),
      child: SizedBox(
        height: 48,
        width: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: BorderRadius.circular(Sizes.small),
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.settingsIcon,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
