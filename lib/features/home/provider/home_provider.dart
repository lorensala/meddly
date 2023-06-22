import 'package:meddly/features/user/provider/user_provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
String greeting(GreetingRef ref) {
  final hour = DateTime.now().hour;
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

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
  const defaultInitials = 'NN';
  final user = ref.watch(userProvider);

  if (user == null) {
    return defaultInitials;
  }
  if (user.firstName.isEmpty || user.lastName.isEmpty) {
    return defaultInitials;
  }

  return '${user.firstName[0]}${user.lastName[0]}';
}

@riverpod
class SelectedIndex extends _$SelectedIndex {
  @override
  int build() {
    return 0;
  }

  // ignore: use_setters_to_change_properties
  void select(int index, {required void Function(int value) onSelected}) {
    onSelected(index);
    state = index;
  }
}
