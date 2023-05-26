import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_error_messages.g.dart';

@riverpod
String? heightErrorMessage(HeightErrorMessageRef ref) {
  final height =
      ref.watch(setupControllerProvider.select((value) => value.height));

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !height.isPure
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
  final weight =
      ref.watch(setupControllerProvider.select((value) => value.weight));

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !weight.isPure
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
  final birthdate =
      ref.watch(setupControllerProvider.select((value) => value.birthdate));

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !birthdate.isPure
      ? birthdate.error?.when(
          invalid: () => l10n.invalidBirthdate,
          empty: () => l10n.birthdateEmpty,
          underage: () => l10n.birthdateUnderage,
        )
      : null;
}

@riverpod
String? lastNameErrorMessage(LastNameErrorMessageRef ref) {
  final lastName =
      ref.watch(setupControllerProvider.select((value) => value.lastname));

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !lastName.isPure
      ? lastName.error?.when(
          invalid: () => l10n.invalidLastName,
          tooLong: () => l10n.lastNameTooLong,
          empty: () => l10n.lastNameEmpty,
        )
      : null;
}

@riverpod
String? nameErrorMessage(NameErrorMessageRef ref) {
  final name = ref.watch(setupControllerProvider.select((value) => value.name));

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !name.isPure
      ? name.error?.when(
          invalid: () => l10n.invalidName,
          tooLong: () => l10n.nameTooLong,
          empty: () => l10n.nameEmpty,
        )
      : null;
}
