import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
          SizedBox(height: Sizes.medium),
          _ResendOtpButton(),
        ],
      ),
    );
  }
}

class _ResendOtpButton extends HookConsumerWidget {
  const _ResendOtpButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = const Duration(seconds: 60);
    final secondsLeft = useState(duration.inSeconds);
    useInterval(
        callback: () {
          secondsLeft.value--;
        },
        delay: const Duration(seconds: 1));

    useInterval(
      delay: duration,
      callback: () {
        secondsLeft.value = duration.inSeconds;
        ref.watch(phoneControllerProvider.notifier).sendPhoneNumber();
      },
    );

    return Center(
      child: Text(context.l10n.resendCode(secondsLeft.value)),
    );
  }
}

class _OtpButton extends ConsumerWidget {
  const _OtpButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isOtpValidProvider);
    //! TODO(lorenzo) : Add loading state
    // final isLoading = ref.watch(phoneControllerProvider).isLoading;
    final notifier = ref.watch(phoneControllerProvider.notifier);
    final smsCode = ref.watch(otpProvider).value;

    return Button(
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

    return PinCodeTextField(
      appContext: context,
      // enabled: false,
      textStyle: context.textTheme.titleLarge,
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
