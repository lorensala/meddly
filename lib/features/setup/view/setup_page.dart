import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/setup/cubit/cubit.dart';
import 'package:meddly/features/setup/widgets/setup_body.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:user/user.dart';

/// {@template setup_page}
/// A description for SetupPage
/// {@endtemplate}
class SetupPage extends StatelessWidget {
  /// {@macro setup_page}
  const SetupPage({super.key});

  /// The static route for SetupPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SetupPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetupCubit(GetIt.I.get<UserRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Setup'),
        ),
        body: const SetupView(),
      ),
    );
  }
}

/// {@template setup_view}
/// Displays the Body of SetupView
/// {@endtemplate}
class SetupView extends StatelessWidget {
  /// {@macro setup_view}
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SetupCubit, SetupState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'User created successfully!',
              ),
            ),
          );
          Navigator.of(context)
              .pushAndRemoveUntil(UserPage.route(), (_) => false);
        }
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.failure!.maybeWhen(
                  notFound: () => context.l10n.userNotFound,
                  timeout: () => context.l10n.timeout,
                  sendTimeout: () => context.l10n.timeout,
                  receiveTimeout: () => context.l10n.timeout,
                  orElse: () => context.l10n.unknownError,
                ),
              ),
            ),
          );
        }
      },
      child: GestureDetector(
        // Dismisses the keyboard when the user taps outside of the text field
        onTap: () => FocusScope.of(context).unfocus(),
        child: const SetupBody(),
      ),
    );
  }
}
