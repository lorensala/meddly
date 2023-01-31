import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/phone/bloc/bloc.dart';
import 'package:meddly/features/phone/cubit/otp_form_cubit.dart';
import 'package:meddly/features/phone/cubit/phone_form_cubit.dart';
import 'package:meddly/features/phone/widgets/otp_form.dart';
import 'package:meddly/features/phone/widgets/phone_form.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template phone_body}
/// Body of the PhonePage.
///
/// Add what it does
/// {@endtemplate}
class PhoneBody extends StatelessWidget {
  /// {@macro phone_body}
  const PhoneBody({required PageController pageController, super.key})
      : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PhoneFormCubit()),
        BlocProvider(create: (context) => OtpFormCubit()),
      ],
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          _PhoneSection(),
          _OtpSection(),
        ],
      ),
    );
  }
}

class _OtpSection extends StatelessWidget {
  const _OtpSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.padding,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.enterCode,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: Sizes.smallSpacing),
            Text(
              context.l10n.enterCodeDescription,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: Sizes.largeSpacing),
            const OtpForm(),
          ],
        ),
      ),
    );
  }
}

class _PhoneSection extends StatelessWidget {
  const _PhoneSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.padding,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.enterPhoneNumber,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: Sizes.smallSpacing),
            Text(
              context.l10n.enterPhoneNumberDescription,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: Sizes.largeSpacing),
            const PhoneForm(),
            const SizedBox(height: Sizes.largeSpacing),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushAndRemoveUntil(UserPage.route(), (_) => false),
                child: Text(
                  context.l10n.skip,
                  style: TextStyle(
                    color: context.colorScheme.onSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
