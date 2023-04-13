import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:validators/validators.dart';

class PhoneForm extends StatelessWidget {
  const PhoneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _CountryCodePhoneNumber(),
        SizedBox(height: Sizes.medium),
        _SendOTPButton(),
        SizedBox(height: Sizes.large),
      ],
    );
  }
}

class _SendOTPButton extends ConsumerWidget {
  const _SendOTPButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isPhoneNumberValidProvider);
    final notifier = ref.watch(phoneControllerProvider.notifier);

    return Button(
      isValid: isValid,
      onPressed: () => notifier.sendPhoneNumber(),
      label: context.l10n.sendOTP,
    );
  }
}

class _CountryCodePhoneNumber extends StatelessWidget {
  const _CountryCodePhoneNumber();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputLabel(label: context.l10n.phoneNumberHint, isRequired: true),
        const SizedBox(height: Sizes.small),
        Row(
          children: [
            _CountryCodeSelector(),
            const SizedBox(width: Sizes.medium),
            Expanded(
              flex: 2,
              child: _PhoneNumberInput(),
            ),
          ],
        ),
      ],
    );
  }
}

class _PhoneNumberInput extends ConsumerWidget {
  const _PhoneNumberInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(phoneFormControllerProvider.notifier);
    final errorText = ref.watch(phoneNumberErrorTextProvider);

    return TextFormField(
      onChanged: notifier.phoneNumberChanged,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        errorMaxLines: 2,
        errorText: errorText,
      ),
    );
  }
}

class _CountryCodeSelector extends ConsumerWidget {
  const _CountryCodeSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryCode = ref.watch(countryCodeProvider);
    final notifier = ref.watch(phoneFormControllerProvider.notifier);
    return Container(
      width: 150,
      padding: Sizes.horizontalPadding.copyWith(
        top: Sizes.small / 2,
        bottom: Sizes.small / 2,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CountryCode>(
          style: context.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
          isExpanded: true,
          value: countryCode,
          onChanged: notifier.countryCodeChanged,
          items: CountryCode.values
              .map(
                (c) => DropdownMenuItem<CountryCode>(
                  value: c,
                  child: Text(
                    '${c.code} (${c.name})',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
