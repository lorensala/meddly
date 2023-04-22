import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class SetupNamePage extends StatelessWidget {
  const SetupNamePage({super.key});

  static const String routeName = '/setup/name';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SetupNamePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.setup),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            height: context.height,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.medium),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: Sizes.medium),
                  Flexible(child: SvgPicture.asset(Vectors.name)),
                  const SizedBox(height: Sizes.medium),
                  FormTitle(
                    title: context.l10n.setupNameTitle,
                    isRequired: true,
                  ),
                  const SizedBox(height: Sizes.small),
                  FormSubtitle(subtitle: context.l10n.setupNameSubtitle),
                  const SizedBox(height: Sizes.extraLarge),
                  const SetupNameInput(),
                  const SizedBox(height: Sizes.medium),
                  const SetupLastnameInput(),
                  const SizedBox(height: Sizes.large),
                  const _NextButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNameValid = ref.watch(setupNameProvider).valid &&
        ref.watch(setupLastnameProvider).value.isNotEmpty;
    final isLastNameValid = ref.watch(setupLastnameProvider).valid &&
        ref.watch(setupLastnameProvider).value.isNotEmpty;

    return Button(
      isValid: isNameValid && isLastNameValid,
      onPressed: () =>
          ref.read(goRouterProvider).push(SetupBirthdatePage.routeName),
      label: context.l10n.next,
    );
  }
}
