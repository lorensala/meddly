import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';

class SupervisorShareCode extends ConsumerWidget {
  const SupervisorShareCode({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider);

    return AsyncValueWidget(
      value: user,
      builder: (user) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              try {
                Share.share('${user?.invitation}');
              } catch (e) {
                showSnackBar(context, 'Error al compartir el código');
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.medium,
                vertical: Sizes.small,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Vectors.share,
                    height: Sizes.medium,
                    width: Sizes.medium,
                    colorFilter: ColorFilter.mode(
                      context.colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: Sizes.small),
                  Text(
                    'Compartir',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
