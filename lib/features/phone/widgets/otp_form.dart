import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/phone/cubit/otp_form_cubit.dart';
import 'package:meddly/features/phone/cubit/phone_form_cubit.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

/// {@template otp_form}
/// Form for the OtpPage.
/// {@endtemplate}
class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sizes.padding,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _OtpField(),
          SizedBox(height: Sizes.mediumSpacing),
          _OtpButton(),
        ],
      ),
    );
  }
}

class _OtpButton extends StatelessWidget {
  const _OtpButton();

  @override
  Widget build(BuildContext context) {
    final otp = context.select((OtpFormCubit cubit) => cubit.state.otp);
    final phoneNumber =
        context.select((PhoneFormCubit cubit) => cubit.state.phoneNumber);
    final isLoading = context.select((PhoneBloc bloc) => bloc.state.isLoading);
    final verificationId = context.select(
      (PhoneBloc bloc) => bloc.state.maybeWhen(
        orElse: () => null,
        error: (verificationId, _) => verificationId,
        codeSentSuccess: (verificationId, _) => verificationId,
      ),
    );

    return Button(
      isLoading: isLoading,
      isValid: otp.valid,
      onPressed: () {
        context.read<PhoneBloc>().add(
              PhoneEvent.verifyPhoneNumber(
                verificationId: verificationId ?? '',
                smsCode: otp.value,
                phoneNumber: phoneNumber.value,
              ),
            );
      },
      label: 'Verify OTP',
    );
  }
}

class _OtpField extends StatelessWidget {
  const _OtpField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OtpFormCubit>();
    final otp = context.select((OtpFormCubit cubit) => cubit.state.otp);
    return ColoredBox(
      color: context.colorScheme.secondary,
      child: PinCodeTextField(
        appContext: context,
        textStyle: context.textTheme.titleLarge,
        animationType: AnimationType.fade,
        backgroundColor: context.colorScheme.secondary,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(Sizes.borderRadius),
          selectedColor: otp.valid
              ? context.colorScheme.primary
              : context.colorScheme.onSecondary,
          activeColor: otp.valid
              ? context.colorScheme.primary
              : context.colorScheme.onSecondary,
          selectedFillColor: context.colorScheme.primary,
          errorBorderColor: context.colorScheme.error,
          activeFillColor: context.colorScheme.primary,
          inactiveColor: context.colorScheme.background,
          inactiveFillColor: context.colorScheme.background,
        ),
        length: 6,
        onChanged: cubit.otpChanged,
      ),
    );
  }
}
