import 'package:meddly/features/setup/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_name_error_message_provider.g.dart';

@riverpod
String? nameErrorMessage(NameErrorMessageRef ref) {
  final name = ref.watch(setupNameProvider);

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !name.pure
      ? name.error?.when(
          invalid: () => l10n.invalidName,
          tooLong: () => l10n.nameTooLong,
          empty: () => l10n.nameEmpty,
        )
      : null;
}
