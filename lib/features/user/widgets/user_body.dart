import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/user/user.dart';

/// {@template user_body}
/// Body of the UserPage.
///
/// Add what it does
/// {@endtemplate}
class UserBody extends ConsumerWidget {
  /// {@macro user_body}
  const UserBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userControllerProvider);

    return userStream.when(
      data: (user) {
        if (user == null) {
          return const Text('No user');
        } else {
          return Text(user.toString());
        }
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const Center(
          child: RepaintBoundary(child: CircularProgressIndicator()),
        );
      },
    );

    // state.whenOrNull(
    //   success: (user) {
    //     if (user.firstName.isEmpty) {
    //       Navigator.of(context).pushAndRemoveUntil(
    //         SetupPage.route(),
    //         (_) => false,
    //       );
    //     } else if (user.phone.isEmpty) {
    //       Navigator.of(context).pushAndRemoveUntil(
    //         PhonePage.route(),
    //         (_) => false,
    //       );
    //     }
    //   },
    //   failure: (failure) => failure.whenOrNull(
    //     notFound: () {},
    // context.read<AuthBloc>().state.whenOrNull(
    //       authenticated: (_) async =>
    //           Navigator.of(context).pushAndRemoveUntil(
    //         SetupPage.route(),
    //         (_) => false,
    //       ),
    //     ),
    //   ),
    // );
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               user.fold(
    //                 () => const Text('No user'),
    //                 (user) => Text(user.toString()),
    //               ),
    //               const SizedBox(height: Sizes.mediumSpacing),
    //               Button(
    //                 onPressed: () =>
    //                     context.read<UserBloc>().add(const UserEvent.logout()),
    //                 label: 'logout',
    //               ),
    //               const SizedBox(height: Sizes.mediumSpacing),
    //               Button(
    //                 onPressed: () =>
    //                     Navigator.of(context).push(SetupPage.route()),
    //                 label: 'setup',
    //               ),
    //               const SizedBox(height: Sizes.mediumSpacing),
    //               Button(
    //                 onPressed: () =>
    //                     Navigator.of(context).push(PhonePage.route()),
    //                 label: 'phone',
    //               ),
    //               const SizedBox(height: Sizes.mediumSpacing),
    //               Button(
    //                 onPressed: () =>
    //                     Navigator.of(context).push(CalendarPage.route()),
    //                 label: 'calendar',
    //               ),
    //               const SizedBox(height: Sizes.mediumSpacing),
    //               Button(
    //                 onPressed: () =>
    //                     Navigator.of(context).push(PredictionsPage.route()),
    //                 label: 'predictions',
    //               ),
    //               const SizedBox(height: Sizes.mediumSpacing),
    //               Button(
    //                 onPressed: () =>
    //                     Navigator.of(context).push(MedicineNamePage.route()),
    //                 label: 'medicine',
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     )
    //   },
    // );
  }
}
