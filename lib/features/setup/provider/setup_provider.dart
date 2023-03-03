import 'package:meddly/features/setup/controller/setup_controller.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'setup_provider.g.dart';

@riverpod
Name setupName(SetupNameRef ref) {
  return ref.watch(setupControllerProvider).name;
}

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

@riverpod
Lastname setupLastname(SetupLastnameRef ref) {
  return ref.watch(setupControllerProvider).lastname;
}

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

@riverpod
Height setupHeight(SetupHeightRef ref) {
  return ref.watch(setupControllerProvider).height;
}

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
Weight setupWeight(SetupWeightRef ref) {
  return ref.watch(setupControllerProvider).weight;
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
SexInput setupSex(SetupSexRef ref) {
  return ref.watch(setupControllerProvider).sex;
}

@riverpod
Birthdate setupBirthdate(SetupBirthdateRef ref) {
  return ref.watch(setupControllerProvider).birthdate;
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

@riverpod
bool requiredFieldsAreValid(RequiredFieldsAreValidRef ref) {
  final name = ref.watch(setupNameProvider);
  final lastname = ref.watch(setupLastnameProvider);
  final sex = ref.watch(setupSexProvider);
  final birthdate = ref.watch(setupBirthdateProvider);

  return name.valid && lastname.valid && birthdate.valid && sex.valid;
}
