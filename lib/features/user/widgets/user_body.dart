import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/bloc/bloc.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/medicine/view/medicine_name_page.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/widgets/widgets.dart';

/// {@template user_body}
/// Body of the UserPage.
///
/// Add what it does
/// {@endtemplate}
class UserBody extends StatelessWidget {
  /// {@macro user_body}
  const UserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listenWhen: (previous, current) =>
          previous.userOrNull?.uid != current.userOrNull?.uid,
      listener: (context, state) {
        state.whenOrNull(
          success: (user) {
            if (user.firstName.isEmpty) {
              Navigator.of(context).pushAndRemoveUntil(
                SetupPage.route(),
                (_) => false,
              );
            } else if (user.phone.isEmpty) {
              Navigator.of(context).pushAndRemoveUntil(
                PhonePage.route(),
                (_) => false,
              );
            }
          },
          failure: (failure) => failure.whenOrNull(
            notFound: () => context.read<AuthBloc>().state.whenOrNull(
                  authenticated: (_) async =>
                      Navigator.of(context).pushAndRemoveUntil(
                    SetupPage.route(),
                    (_) => false,
                  ),
                ),
          ),
        );
      },
      builder: (context, state) {
        return Padding(
          padding: Sizes.padding,
          child: state.when(
            loading: () => const Center(
              child: RepaintBoundary(child: CircularProgressIndicator()),
            ),
            failure: (failure) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(failure.toString()),
                    const SizedBox(height: Sizes.mediumSpacing),
                    Button(
                      onPressed: () => context
                          .read<UserBloc>()
                          .add(const UserEvent.logout()),
                      label: 'logout',
                    ),
                  ],
                ),
              );
            },
            success: (user) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(user.toString()),
                  const SizedBox(height: Sizes.mediumSpacing),
                  Button(
                    onPressed: () =>
                        context.read<UserBloc>().add(const UserEvent.logout()),
                    label: 'logout',
                  ),
                  const SizedBox(height: Sizes.mediumSpacing),
                  Button(
                    onPressed: () =>
                        Navigator.of(context).push(SetupPage.route()),
                    label: 'setup',
                  ),
                  const SizedBox(height: Sizes.mediumSpacing),
                  Button(
                    onPressed: () =>
                        Navigator.of(context).push(PhonePage.route()),
                    label: 'phone',
                  ),
                  const SizedBox(height: Sizes.mediumSpacing),
                  Button(
                    onPressed: () =>
                        Navigator.of(context).push(CalendarPage.route()),
                    label: 'calendar',
                  ),
                  const SizedBox(height: Sizes.mediumSpacing),
                  Button(
                    onPressed: () =>
                        Navigator.of(context).push(PredictionsPage.route()),
                    label: 'predictions',
                  ),
                  const SizedBox(height: Sizes.mediumSpacing),
                  Button(
                    onPressed: () =>
                        Navigator.of(context).push(MedicineNamePage.route()),
                    label: 'medicine',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
