import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/forgot_password/forgot_password.dart';
import 'package:meddly/features/login/controller/login_controller.dart';
import 'package:meddly/features/login/provider/login_provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.mediumPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _EmailInput(),
          SizedBox(height: Sizes.medium),
          _PasswordInput(),
          SizedBox(height: Sizes.medium),
          _ForgotPassword(),
          SizedBox(height: Sizes.medium),
          _LoginButton(),
        ],
      ),
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(ForgotPasswordPage.route());
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
          context.l10n.forgotPassword,
        ),
      ),
    );
  }
}

class _LoginButton extends ConsumerWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider).isLoading;
    final isValid = ref.watch(isLoginFormValidProvider);

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: () => ref
          .watch(loginControllerProvider.notifier)
          .logInWithEmailAndPassword(),
      label: context.l10n.login,
    );
  }
}

class _EmailInput extends ConsumerWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: ref.watch(loginControllerProvider.notifier).onEmailChanged,
      keyboardType: TextInputType.emailAddress,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: context.l10n.emailHint,
      ),
    );
  }
}

class _PasswordInput extends HookConsumerWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordObscure = useState(true);
    final isValid = ref.watch(isLoginFormValidProvider);

    return TextFormField(
      textInputAction: TextInputAction.done,
      onChanged: ref.watch(loginControllerProvider.notifier).onPasswordChanged,
      onFieldSubmitted: (String? value) {
        if (isValid) {
          HapticFeedback.lightImpact();
          ref
              .watch(loginControllerProvider.notifier)
              .logInWithEmailAndPassword();
        }
      },
      keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: isPasswordObscure.value,
      decoration: InputDecoration(
        hintText: context.l10n.passwordHint,
        prefixIconConstraints: BoxConstraints.tight(const Size(52, 20)),
        suffixIcon: GestureDetector(
          onTap: () => isPasswordObscure.value = !isPasswordObscure.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
            child: SvgPicture.asset(
              isPasswordObscure.value ? Vectors.eyeOff : Assets.eye,
              theme: SvgTheme(currentColor: context.colorScheme.onSecondary),
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 64,
          maxWidth: 64,
        ),
      ),
    );
  }
}
