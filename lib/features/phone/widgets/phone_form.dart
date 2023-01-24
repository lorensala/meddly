import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/phone/cubit/phone_form_cubit.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:validators/validators.dart';

class PhoneForm extends StatelessWidget {
  const PhoneForm({super.key});

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
          _PhoneNumberInput(),
          SizedBox(height: Sizes.mediumSpacing),
          _SendOTPButton(),
          SizedBox(height: Sizes.largeSpacing),
        ],
      ),
    );
  }
}

class _SendOTPButton extends StatelessWidget {
  const _SendOTPButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneFormCubit, PhoneFormState>(
      builder: (context, state) {
        final isValid = state.status.isValid;

        return Button(
          isValid: isValid,
          onPressed: () => context.read<PhoneBloc>().add(
                PhoneEvent.sendPhoneNumber(
                  phoneNumber: '${state.countryCode}${state.phoneNumber.value}',
                ),
              ),
          label: context.l10n.sendOTP,
        );
      },
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PhoneFormCubit>();
    return BlocBuilder<PhoneFormCubit, PhoneFormState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber ||
          previous.countryCode != current.countryCode,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InputLabel(label: context.l10n.phoneNumberHint, isRequired: false),
            const SizedBox(height: Sizes.smallSpacing),
            Row(
              children: [
                Container(
                  width: 150,
                  padding: Sizes.horizontalPadding.copyWith(
                    top: Sizes.smallSpacing / 2,
                    bottom: Sizes.smallSpacing / 2,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.background,
                    borderRadius: BorderRadius.circular(Sizes.borderRadius),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CountryCode>(
                      style: context.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      isExpanded: true,
                      value: state.countryCode,
                      onChanged: cubit.countryCodeChanged,
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
                ),
                const SizedBox(width: Sizes.mediumSpacing),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    onChanged: cubit.phoneNumberChanged,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                      errorMaxLines: 2,
                      errorText: !state.phoneNumber.pure
                          ? state.phoneNumber.error?.when(
                              invalid: () => context.l10n.invalidPhoneNumber,
                              empty: () => context.l10n.phoneNumberEmpty,
                              notNumeric: () =>
                                  context.l10n.phoneNumberNotNumeric,
                              tooLong: () => context.l10n.phoneNumberTooLong,
                              tooShort: () => context.l10n.phoneNumberTooShort,
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
