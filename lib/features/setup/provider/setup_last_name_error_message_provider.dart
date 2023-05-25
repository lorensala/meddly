import 'package:meddly/features/setup/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_last_name_error_message_provider.g.dart';

@riverpod
String? lastnameErrorMessage(LastnameErrorMessageRef ref) {
  final lastName = ref.watch(setupLastnameProvider);

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !lastName.pure
      ? lastName.error?.when(
          invalid: () => l10n.invalidLastName,
          tooLong: () => l10n.lastNameTooLong,
          empty: () => l10n.lastNameEmpty,
        )
      : null;
}
