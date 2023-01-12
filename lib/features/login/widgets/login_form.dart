import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/core/sizes.dart';
import 'package:meddly/features/login/cubit/login_cubit.dart';
import 'package:meddly/l10n/l10n.dart';

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
          SizedBox(height: 16),
          _PasswordInput(),
          // GestureDetectorWithHaptic(
          //   onTap: () {
          //     //context.router.push(const ForgotPasswordRoute());
          //   },
          //   child: Align(
          //     alignment: Alignment.centerRight,
          //     child: Text('¿Olvidaste tu contraseña?',
          //         style: textTheme.bodyMedium!.copyWith(
          //             color: context.colorScheme.primary,
          //             fontWeight: FontWeight.w700)),
          //   ),
          // ),
          // const SizedBox(height: 30),
          // BlocBuilder<LoginCubit, LoginState>(
          //   builder: (context, state) {
          //     return Button(
          //         isLoading: state.status.isSubmissionInProgress,
          //         onTap: () => BlocProvider.of<LoginCubit>(context)
          //             .logInWithEmailAndPassword(),
          //         title: 'Iniciar sesión');
          //   },
          // ),
        ],
      ),
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
            errorText: !state.email.pure
                ? state.email.error?.when(
                    invalid: () => context.l10n.invalidEmail,
                    empty: () => context.l10n.emailEmpty,
                  )
                : null,
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
            HapticFeedback.lightImpact();

            BlocProvider.of<LoginCubit>(context).logInWithEmailAndPassword();
          },
          keyboardType: TextInputType.text,
          style: Theme.of(context).textTheme.bodyMedium,
          obscureText: state.obscurePassword,
          decoration: InputDecoration(
            hintText: context.l10n.passwordHint,
            prefixIconConstraints: BoxConstraints.tight(const Size(52, 20)),
            suffixIcon: GestureDetector(
              onTap: cubit.obscurePasswordChanged,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.remove_red_eye),
                // child: SvgPicture.asset(
                //   isPasswordObscure.value ? Assets.eyeCrossed : Assets.eye,
                //   color: context.colorScheme.secondaryContainer,
                // ),
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
