import 'package:flutter/material.dart';
import 'package:meddly/features/phone/bloc/bloc.dart';
import 'package:meddly/features/phone/widgets/phone_body.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template phone_page}
/// A description for PhonePage
/// {@endtemplate}
class PhonePage extends StatelessWidget {
  /// {@macro phone_page}
  const PhonePage({super.key});

  /// The static route for PhonePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PhonePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PhoneView(),
    );
  }
}

/// {@template phone_view}
/// Displays the Body of PhoneView
/// {@endtemplate}
class PhoneView extends StatefulWidget {
  /// {@macro phone_view}
  const PhoneView({super.key});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneBloc, PhoneState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (_, failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    failure.maybeWhen(
                      orElse: () => context.l10n.unknownError,
                      invalidPhoneNumber: () => context.l10n.invalidPhoneNumber,
                      serverError: () => context.l10n.serverError,
                      invalidVerificationCode: () =>
                          context.l10n.invalidVerificationCode,
                      operationNotAllowed: () =>
                          context.l10n.operationNotAllowed,
                      userDisabled: () => context.l10n.userDisabled,
                      userNotFound: () => context.l10n.userNotFound,
                      tooManyRequests: () => context.l10n.tooManyRequests,
                    ),
                  ),
                ),
              );
          },
          codeSentSuccess: (
            _,
            __,
          ) =>
              _pageController.nextPage(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
          ),
          verificated: () => Navigator.of(context).push(UserPage.route()),
        );
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: PhoneBody(
          pageController: _pageController,
        ),
      ),
    );
  }
}
