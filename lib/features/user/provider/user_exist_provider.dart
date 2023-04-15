import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/setup/view/setup_name_page.dart';
import 'package:meddly/features/user/provider/user_repository_provider.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_exist_provider.g.dart';

// TODO(me): In user_controller???

@riverpod
Future<void> userExist(UserExistRef ref) async {
  final router = ref.read(goRouterProvider);
  // Check if Firebase User is logged in.
  final user = ref.read(currentUserProvider);

  // If false, navigate to [OnboardingPage].
  if (user == null) {
    return router.go(OnboardingPage.routeName);
  }

  // If true, check if the user exists in cache.
  final res = ref.read(userRepositoryProvider).getUser();

  // If an error ocurrs, fetch the user from the database.
  if (res.isLeft()) {
    final res = await ref.read(userRepositoryProvider).fetchUser();

    // If the user doesn't exist in the database, navigate to [SetupPage].
    if (res.isRight()) {
      final user = res.asRight();

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
      // If an error ocurrs, navigate to [OnboardingPage].
      //! TODO: error.....
      return router.go(OnboardingPage.routeName);
    }
  }

  // If true, check if the user is not null and has basic information.
  if (res.isRight()) {
    var user = res.asRight();

    // If the user is null, navigate to [OnboardingPage].
    if (user == null) {
      final res = await ref.read(userRepositoryProvider).fetchUser();
      if (res.isLeft()) {
        return router.go(OnboardingPage.routeName);
      } else {
        user = res.asRight();
      }
    }

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
