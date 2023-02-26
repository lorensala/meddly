import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/phone/controller/otp_form_controller.dart';
import 'package:meddly/features/phone/controller/phone_controller.dart';
import 'package:meddly/features/phone/provider/otp_form_provider.dart';
import 'package:meddly/features/user/user.dart';
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
          SizedBox(height: Sizes.mediumSpacing),
          // _ResendOtpButton(),
        ],
      ),
    );
  }
}

class _ResendOtpButton extends StatefulWidget {
  const _ResendOtpButton();

  @override
  State<_ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends State<_ResendOtpButton> {
  late final Timer _timer;
  int _start = 30;

  @override
  void initState() {
    // final phoneNumber = context.read<PhoneFormCubit>().state.phoneNumber;

    // final forceResendingToken = context.read<PhoneBloc>().state.whenOrNull(
    //       codeSentSuccess: (_, forceResendingToken) => forceResendingToken,
    //     );

    // _timer = Timer.periodic(
    //   const Duration(seconds: 1),
    //   (timer) => setState(() {
    //     _start = _start - 1;
    //     if (_start == 0) {
    //       timer.cancel();
    //       context.read<PhoneBloc>().add(
    //             PhoneEvent.sendPhoneNumber(
    //               phoneNumber: phoneNumber.value,
    //               forceResendingToken: forceResendingToken,
    //             ),
    //           );
    //       _start = 30;
    //     }
    //   }),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _timer.isActive
            ? '${context.l10n.resendCode} in $_start seconds'
            : context.l10n.resendCode,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

class _OtpButton extends ConsumerWidget {
  const _OtpButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isOtpValidProvider);
    final isLoading = ref.watch(userControllerProvider).isLoading;
    final notifier = ref.watch(phoneControllerProvider.notifier);
    final smsCode = ref.watch(otpProvider).value;

    return Button(
      isLoading: isLoading,
      isValid: isValid,
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
          selectedColor: isValid
              ? context.colorScheme.primary
              : context.colorScheme.onSecondary,
          activeColor: isValid
              ? context.colorScheme.primary
              : context.colorScheme.onSecondary,
          selectedFillColor: context.colorScheme.primary,
          errorBorderColor: context.colorScheme.error,
          activeFillColor: context.colorScheme.primary,
          inactiveColor: context.colorScheme.background,
          inactiveFillColor: context.colorScheme.background,
        ),
        length: 6,
        onChanged: notifier.otpChanged,
      ),
    );
  }
}
