import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/controller/login_controller.dart';
import 'package:meddly/features/login/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';

class PasswordInput extends HookConsumerWidget {
  const PasswordInput({super.key});

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
