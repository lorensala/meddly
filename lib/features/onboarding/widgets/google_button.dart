import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/l10n/l10n.dart';

class GoogleButton extends ConsumerWidget {
  const GoogleButton({super.key});

  static const _duration = Duration(milliseconds: 100);
  static const _height = 60.0;
  static const _loadingSize = 20.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider).isLoading;

    return Center(
      child: AnimatedContainer(
        width: isLoading ? _height : MediaQuery.of(context).size.width,
        duration: _duration,
        child: ElevatedButtonTheme(
          data: ElevatedButtonThemeData(
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    context.colorScheme.secondaryContainer,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
          ),
          child: ElevatedButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              FocusScope.of(context).unfocus();
              ref.read(authControllerProvider.notifier).logInWithGoogle();
            },
            child: isLoading
                ? SizedBox(
                    height: _loadingSize,
                    width: _loadingSize,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.medium),
                          child: SvgPicture.asset(Assets.googleIcon),
                        ),
                      ),
                      Center(child: Text(context.l10n.loginWithGoogle)),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
