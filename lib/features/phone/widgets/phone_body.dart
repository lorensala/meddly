import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/phone/controller/phone_controller.dart';
import 'package:meddly/features/phone/widgets/otp_form.dart';
import 'package:meddly/features/phone/widgets/phone_form.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template phone_body}
/// Body of the PhonePage.
///
/// Add what it does
/// {@endtemplate}
class PhoneBody extends HookConsumerWidget {
  /// {@macro phone_body}
  const PhoneBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();

    ref.listen(phoneControllerProvider, (_, state) {
      if (state.isLoading) {
        controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: const [
        _PhoneSection(),
        _OtpSection(),
      ],
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
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: Sizes.smallSpacing),
            Text(
              context.l10n.enterPhoneNumberDescription,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: Sizes.largeSpacing),
            const PhoneForm(),
            const SizedBox(height: Sizes.largeSpacing),
          ],
        ),
      ),
    );
  }
}
