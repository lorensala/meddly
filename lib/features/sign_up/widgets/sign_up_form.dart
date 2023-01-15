import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/utils/utils.dart';
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
          SizedBox(height: Sizes.spacing),
          _PasswordInput(),
          SizedBox(height: Sizes.spacing),
          _TermsAndConditions(),
          SizedBox(height: Sizes.spacing),
          _SignUpButton(),
        ],
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);

    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Button(
          isValid: state.email.valid &&
              state.password.valid &&
              state.termsAndConditions.valid,
          isLoading: state.status.isSubmissionInProgress,
          onPressed: cubit.signUp,
          label: context.l10n.signUp,
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        final cubit = BlocProvider.of<SignUpCubit>(context);

        return TextFormField(
          textInputAction: TextInputAction.next,
          onChanged: cubit.onEmailChanged,
          keyboardType: TextInputType.emailAddress,
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: context.l10n.emailHint,
            errorText: !state.email.pure
                ? state.email.error?.when(
                    invalid: () => context.l10n.invalidEmail,
                    empty: () => context.l10n.emailEmpty,
                  )
                : null,
            suffixIcon:
                state.email.valid ? const CircleCheckSuffixIcon() : null,
            prefixIconConstraints: BoxConstraints.tight(const Size(52, 20)),
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
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.obscurePassword != current.obscurePassword,
      builder: (context, state) {
        final cubit = BlocProvider.of<SignUpCubit>(context);
        return TextFormField(
          textInputAction: TextInputAction.next,
          onChanged: cubit.onPasswordChanged,
          keyboardType: TextInputType.text,
          style: context.textTheme.bodyMedium,
          obscureText: state.obscurePassword,
          decoration: InputDecoration(
            hintText: context.l10n.passwordHint,
            errorText: !state.password.pure
                ? state.password.error?.when(
                    empty: () => context.l10n.passwordEmpty,
                    invalid: () => context.l10n.invalidPassword,
                    tooShort: () => context.l10n.passwordTooShort,
                  )
                : null,
            errorMaxLines: 5,
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: cubit.togglePasswordVisibility,
                  child: SvgPicture.asset(
                    state.obscurePassword ? Assets.eyeCrossed : Assets.eye,
                    height: 20,
                    width: 20,
                    color: context.colorScheme.onSecondary,
                  ),
                ),
                if (state.password.valid) const CircleCheckSuffixIcon(),
              ],
            ),
          ),
        );
      },
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
