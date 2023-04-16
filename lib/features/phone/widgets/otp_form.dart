import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/phone/controller/otp_form_controller.dart';
import 'package:meddly/features/phone/controller/phone_controller.dart';
import 'package:meddly/features/phone/provider/otp_form_provider.dart';
import 'package:meddly/l10n/l10n.dart';
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
      padding: Sizes.mediumPadding,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _OtpField(),
          SizedBox(height: Sizes.medium),
          _OtpButton(),
          SizedBox(height: Sizes.large),
          _ResendOtpButton(),
        ],
      ),
    );
  }
}

class _ResendOtpButton extends ConsumerWidget {
  const _ResendOtpButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: GestureDetector(
        onTap: () =>
            ref.read(phoneControllerProvider.notifier).sendPhoneNumber(),
        child: Text(
          context.l10n.resendCode,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class _OtpButton extends ConsumerWidget {
  const _OtpButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isOtpValidProvider);
    final isLoading = ref.watch(phoneControllerProvider).isVerifyingOtp;
    final notifier = ref.watch(phoneControllerProvider.notifier);
    final smsCode = ref.watch(otpProvider).value;

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: () => notifier.verifyPhone(smsCode),
      label: 'Verify OTP',
    );
  }
}

class _OtpField extends ConsumerWidget {
  const _OtpField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(otpFormControllerProvider.notifier);
    final isValid = ref.watch(otpFormControllerProvider).otp.valid;

    return PinCodeTextField(
      appContext: context,
      // enabled: false,
      textStyle: context.textTheme.titleLarge,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      backgroundColor: context.colorScheme.background,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
        selectedColor:
            isValid ? context.colorScheme.primary : context.colorScheme.surface,
        activeColor:
            isValid ? context.colorScheme.primary : context.colorScheme.surface,
        selectedFillColor: context.colorScheme.primary,
        errorBorderColor: context.colorScheme.error,
        activeFillColor: context.colorScheme.primary,
        inactiveColor: context.colorScheme.surface,
        inactiveFillColor: context.colorScheme.onSecondary,
      ),
      length: 6,
      onChanged: notifier.otpChanged,
    );
  }
}
