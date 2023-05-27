// ignore_for_file: lines_longer_than_80_chars

import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/setup/view/setup_name_page.dart';
import 'package:meddly/features/user/provider/user_repository_provider.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_exist_provider.g.dart';

@riverpod
FutureOr<void> userExist(UserExistRef ref) async {
  final router = ref.read(goRouterProvider);
  // Check if Firebase User is logged in.
  final user = ref.read(userProvider);

  // If false, navigate to [OnboardingPage].
  if (user.isEmpty) {
    return router.go(OnboardingPage.routeName);
  }

  // If true, check if the user exists in cache.
  final (cacheError, cacheUser) = ref.read(userRepositoryProvider).getUser();

  // If an error ocurrs, fetch the user from the database.
  if (cacheError != null) {
    final (remoteError, remoteUser) =
        await ref.read(userRepositoryProvider).fetchUser();

    // If the user doesn't exist in the database, navigate to [SetupPage].
    if (remoteError != null) {
      return router.go(OnboardingPage.routeName);
    }

    final user = remoteUser!;

    // If the user has basic information and phoneNumber, navigate to [HomePage].
    if (user.hasBasicInformation && user.hasPhoneNumber) {
      return router.go(HomePage.routeName);
    }

    // If the user has basic information but not phoneNumber, navigate to [PhoneNumberPage].
    if (user.hasBasicInformation && !user.hasPhoneNumber) {
      return router.go(PhonePage.routeName);
    }

    // If the user doesn't have basic information, navigate to [SetupPage].
    return router.go(SetupNamePage.routeName);
  } else {
    // If true, check if the user is not null and has basic information.
    if (cacheUser == null) {
      final (remoteError, remoteUser) =
          await ref.read(userRepositoryProvider).fetchUser();

      if (remoteError != null) {
        // If the user is null, navigate to [OnboardingPage].
        return router.go(OnboardingPage.routeName);
      }

      final user = remoteUser!;

      // If the user has basic information and phoneNumber, navigate to [HomePage].
      if (user.hasBasicInformation && user.hasPhoneNumber) {
        return router.go(HomePage.routeName);
      }

      // If the user has basic information but not phoneNumber, navigate to [PhoneNumberPage].
      if (user.hasBasicInformation && !user.hasPhoneNumber) {
        return router.go(PhonePage.routeName);
      }

      // If the user doesn't have basic information, navigate to [SetupPage].
      return router.go(SetupNamePage.routeName);
    } else {
      final user = cacheUser;

      // If the user has basic information and phoneNumber, navigate to [HomePage].
      if (user.hasBasicInformation && user.hasPhoneNumber) {
        return router.go(HomePage.routeName);
      }

      // If the user has basic information but not phoneNumber, navigate to [PhoneNumberPage].
      if (user.hasBasicInformation && !user.hasPhoneNumber) {
        return router.go(PhonePage.routeName);
      }

      // If the user doesn't have basic information, navigate to [SetupPage].
      return router.go(SetupNamePage.routeName);
    }
  }
}
