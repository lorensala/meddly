import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/home/provider/provider.dart';
import 'package:meddly/features/user/controller/controller.dart';

class AvatarAndSettings extends StatelessWidget {
  const AvatarAndSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        UserAvatar(),
        Spacer(),
        SettingsButton(),
      ],
    );
  }
}

class SettingsButton extends ConsumerWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.watch(userControllerProvider.notifier).logout(),
      child: SizedBox(
        height: 48,
        width: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: BorderRadius.circular(Sizes.borderRadius),
          ),
          child: Center(child: SvgPicture.asset(Assets.settingsIcon)),
        ),
      ),
    );
  }
}

class UserAvatar extends ConsumerWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInitials = ref.watch(userInitialsProvider);
    return CircleAvatar(
      radius: 24,
      backgroundColor: context.colorScheme.primary,
      child: Text(
        userInitials,
        style: TextStyle(color: context.colorScheme.onPrimary),
      ),
    );
  }
}
