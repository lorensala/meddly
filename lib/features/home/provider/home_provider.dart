import 'package:meddly/features/user/provider/user_provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
String greeting(GreetingRef ref) {
  final hour = DateTime.now().hour;
  final l10n = ref.watch(l10nProvider);
  if (hour < 12) {
    return l10n.greetingMorning;
  } else if (hour < 18) {
    return l10n.greetingAfternoon;
  } else {
    return l10n.greetingEvening;
  }
}

@riverpod
String userInitials(UserInitialsRef ref) {
  return ref.watch(userProvider).fold(
    () => 'AN',
    (user) {
      return '${user.firstName[0]}${user.lastName[0]}';
    },
  );
}
