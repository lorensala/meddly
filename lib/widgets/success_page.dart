import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/home/view/home_page.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/theme/theme.dart';

class SuccessPage extends HookConsumerWidget {
  const SuccessPage({super.key});

  static const routeName = '/success';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future.delayed(const Duration(seconds: 2), () {
          ref.read(goRouterProvider).go(HomePage.routeName);
        });
        return null;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Vectors.checkCircle,
              height: context.width * 0.4,
              colorFilter: ColorFilter.mode(
                context.colorScheme.success,
                BlendMode.srcIn,
              ),
            ).animate().scale(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  alignment: Alignment.center,
                ),
            const SizedBox(height: Sizes.large),
            Center(
              child: Text(
                context.l10n.operationSuccessful,
                style: context.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
