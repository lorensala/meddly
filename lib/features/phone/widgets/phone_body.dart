import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
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

  static const Duration _duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();

    ref.listen(phoneControllerProvider, (_, state) {
      if (state.isOtpSent) {
        controller.nextPage(
          duration: _duration,
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
    return SingleChildScrollView(
      reverse: true,
      child: SizedBox(
        height: context.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: Sizes.medium),
            Flexible(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.medium),
                    child: SvgPicture.asset(Vectors.otp),),),
            const SizedBox(height: Sizes.large),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.l10n.enterCode,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(height: Sizes.small),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(context.l10n.enterCodeDescription,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onBackground.withOpacity(0.5),
                    ),),
              ),
            ),
            const SizedBox(height: Sizes.small),
            const OtpForm(),
            const SizedBox(height: Sizes.large),
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
    return SingleChildScrollView(
      reverse: true,
      child: SizedBox(
        height: context.height,
        child: Padding(
          padding: Sizes.mediumPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: Sizes.medium),
              Flexible(child: SvgPicture.asset(Vectors.phoneNumber)),
              const SizedBox(height: Sizes.large),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.l10n.enterPhoneNumber,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: Sizes.small),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.l10n.enterPhoneNumberDescription,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colorScheme.onBackground.withOpacity(0.5),
                  ),
                ),
              ),
              const SizedBox(height: Sizes.large),
              const PhoneForm(),
              const SizedBox(height: Sizes.large),
            ],
          ),
        ),
      ),
    );
  }
}
