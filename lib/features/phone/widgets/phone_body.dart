import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/phone/bloc/bloc.dart';
import 'package:meddly/features/phone/cubit/phone_form_cubit.dart';
import 'package:meddly/features/phone/widgets/phone_form.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template phone_body}
/// Body of the PhonePage.
///
/// Add what it does
/// {@endtemplate}
class PhoneBody extends StatelessWidget {
  /// {@macro phone_body}
  const PhoneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneFormCubit(),
      child: Padding(
        padding: Sizes.padding,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.enterPhoneNumber,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: Sizes.smallSpacing),
              Text(
                context.l10n.enterPhoneNumberDescription,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: Sizes.largeSpacing),
              const Center(child: PhoneForm()),
            ],
          ),
        ),
      ),
    );
  }
}
