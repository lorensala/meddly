import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/sign_up/sign_up.dart';
import 'package:meddly/l10n/l10n.dart';

class SignUpPasswordInput extends HookConsumerWidget {
  const SignUpPasswordInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordObscure = useState(true);
    final notifier = ref.watch(signUpControllerProvider.notifier);
    final errorText = ref.watch(passwordErrorMessageProvider);

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
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
          child: GestureDetector(
            onTap: () => isPasswordObscure.value = !isPasswordObscure.value,
            child: SvgPicture.asset(
              isPasswordObscure.value ? Vectors.eyeOff : Vectors.eye,
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
