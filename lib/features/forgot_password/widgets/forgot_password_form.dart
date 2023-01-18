import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/forgot_password/cubit/cubit.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

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
          SizedBox(height: Sizes.mediumSpacing),
          _SendPasswordResetEmailButton(),
        ],
      ),
    );
  }
}

class _SendPasswordResetEmailButton extends StatelessWidget {
  const _SendPasswordResetEmailButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        final cubit = context.watch<ForgotPasswordCubit>();

        return Button(
          isValid: state.email.valid,
          isLoading: state.status.isSubmissionInProgress,
          onPressed: cubit.sendPasswordResetEmail,
          label: context.l10n.sendPasswordResetEmail,
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ForgotPasswordCubit>();
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          onChanged: cubit.onEmailChanged,
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
