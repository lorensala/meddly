import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/router/provider/go_router_provider.dart';

class NotificationsButton extends ConsumerWidget {
  const NotificationsButton({
    super.key,
  });

  static const double _iconSize = 24;
  static const double _size = 48;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(goRouterProvider).push(NotificationsPage.routeName),
      child: SizedBox(
        height: _size,
        width: _size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(Sizes.small),
          ),
          child: Center(
            child: SvgPicture.asset(
              Vectors.bell,
              colorFilter: ColorFilter.mode(
                context.colorScheme.onBackground,
                BlendMode.srcIn,
              ),
              width: _iconSize,
              height: _iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
