import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/onboarding/cubit/cubit.dart';
import 'package:meddly/l10n/l10n.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (OnboardingCubit cubit) => cubit.state.isLoading,
    );
    return Center(
      child: AnimatedContainer(
        width:
            isLoading ? Sizes.buttonHeight : MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 100),
        child: ElevatedButtonTheme(
          data: ElevatedButtonThemeData(
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.secondary,
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
              onPressed();
            },
            child: isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
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
