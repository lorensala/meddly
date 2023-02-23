import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/sign_up/controller/sign_up_controller.dart';
import 'package:meddly/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:meddly/features/sign_up/provider/sign_up_provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sizes.padding,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _EmailInput(),
          SizedBox(height: Sizes.mediumSpacing),
          _PasswordInput(),
          SizedBox(height: Sizes.mediumSpacing),
          _TermsAndConditions(),
          SizedBox(height: Sizes.mediumSpacing),
          _SignUpButton(),
        ],
      ),
    );
  }
}

class _SignUpButton extends ConsumerWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signUpControllerProvider.notifier);
    final isFormValid = ref.watch(isSignUpFormValidProvider);
    final isLoading = ref.watch(authControllerProvider).isLoading;

    return Button(
      isValid: isFormValid,
      isLoading: isLoading,
      onPressed: notifier.registerWithEmailAndPassword,
      label: context.l10n.signUp,
    );
  }
}

class _EmailInput extends ConsumerWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(emailErrorMessageProvider);
    final showSuffixIcon = ref.watch(isSignUpEmailValidProvider);
    final notifier = ref.watch(signUpControllerProvider.notifier);

    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: notifier.onEmailChanged,
      keyboardType: TextInputType.emailAddress,
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: context.l10n.emailHint,
        errorText: errorText,
        suffixIcon: showSuffixIcon ? const CircleCheckSuffixIcon() : null,
        prefixIconConstraints: BoxConstraints.tight(const Size(52, 20)),
      ),
    );
  }
}

class _PasswordInput extends HookConsumerWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordObscure = useState(true);
    final notifier = ref.watch(signUpControllerProvider.notifier);
    final errorText = ref.watch(passwordErrorMessageProvider);
    final showSuffixIcon = ref.watch(isSignUpPasswordValidProvider);

    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: notifier.onPasswordChanged,
      keyboardType: TextInputType.text,
      style: context.textTheme.bodyMedium,
      obscureText: isPasswordObscure.value,
      decoration: InputDecoration(
        hintText: context.l10n.passwordHint,
        errorText: errorText,
        errorMaxLines: 5,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => isPasswordObscure.value = !isPasswordObscure.value,
              child: SvgPicture.asset(
                isPasswordObscure.value ? Assets.eyeCrossed : Assets.eye,
                height: 20,
                width: 20,
                color: context.colorScheme.onSecondary,
              ),
            ),
            if (showSuffixIcon) const CircleCheckSuffixIcon(),
          ],
        ),
      ),
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);
    return Row(
      children: [
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              activeColor: context.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              value: state.termsAndConditions.value,
              onChanged: (bool? value) {
                HapticFeedback.lightImpact();
                cubit.onTermsAcceptedChanged(value: value!);
              },
            );
          },
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${context.l10n.accept} ',
                  style: context.textTheme.bodyMedium,
                ),
                TextSpan(
                  text: context.l10n.termsAndConditions,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
