import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_error_messages.g.dart';

@riverpod
String? heightErrorMessage(HeightErrorMessageRef ref) {
  final height = ref.watch(setupHeightProvider);

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !height.pure
      ? height.error?.when(
          invalid: () => l10n.invalidHeight,
          empty: () => l10n.heightEmpty,
          negative: () => l10n.heightNegative,
          zero: () => l10n.heightZero,
        )
      : null;
}

@riverpod
String? weightErrorMessage(WeightErrorMessageRef ref) {
  final weight = ref.watch(setupWeightProvider);

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !weight.pure
      ? weight.error?.when(
          invalid: () => l10n.invalidWeight,
          empty: () => l10n.weightEmpty,
          negative: () => l10n.weightNegative,
          zero: () => l10n.weightZero,
        )
      : null;
}

@riverpod
String? birthdateErrorMessage(BirthdateErrorMessageRef ref) {
  final birthdate = ref.watch(setupBirthdateProvider);

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !birthdate.pure
      ? birthdate.error?.when(
          invalid: () => l10n.invalidBirthdate,
          empty: () => l10n.birthdateEmpty,
          underage: () => l10n.birthdateUnderage,
        )
      : null;
}
