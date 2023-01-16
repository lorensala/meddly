import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/forgot_password/forgot_password.dart';
import 'package:meddly/features/login/cubit/login_cubit.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/utils/utils.dart';
import 'package:meddly/widgets/button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sizes.padding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _EmailInput(),
          SizedBox(height: Sizes.spacing),
          _PasswordInput(),
          SizedBox(height: Sizes.spacing),
          _ForgotPassword(),
          SizedBox(height: Sizes.spacing),
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

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (LoginCubit cubit) => cubit.state.status.isSubmissionInProgress,
    );
    final isValid = context.select(
      (LoginCubit cubit) =>
          cubit.state.email.value.isNotEmpty &&
          cubit.state.password.value.isNotEmpty,
    );

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: () => context.read<LoginCubit>().logInWithEmailAndPassword(),
      label: context.l10n.login,
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        final cubit = BlocProvider.of<LoginCubit>(context);
        return TextFormField(
          textInputAction: TextInputAction.next,
          onChanged: cubit.onEmailChanged,
          keyboardType: TextInputType.emailAddress,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: context.l10n.emailHint,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.obscurePassword != current.obscurePassword,
      builder: (context, state) {
        final cubit = BlocProvider.of<LoginCubit>(context);
        return TextFormField(
          textInputAction: TextInputAction.done,
          onChanged: cubit.onPasswordChanged,
          onFieldSubmitted: (String? value) {
            if (state.password.value.isNotEmpty &&
                state.email.value.isNotEmpty) {
              HapticFeedback.lightImpact();
              BlocProvider.of<LoginCubit>(context).logInWithEmailAndPassword();
            }
          },
          keyboardType: TextInputType.text,
          style: Theme.of(context).textTheme.bodyMedium,
          obscureText: state.obscurePassword,
          decoration: InputDecoration(
            hintText: context.l10n.passwordHint,
            prefixIconConstraints: BoxConstraints.tight(const Size(52, 20)),
            suffixIcon: GestureDetector(
              onTap: cubit.obscurePasswordChanged,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  state.obscurePassword ? Assets.eyeCrossed : Assets.eye,
                  color: context.colorScheme.onSecondary,
                ),
              ),
            ),
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
          ),
        );
      },
    );
  }
}
