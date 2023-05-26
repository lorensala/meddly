import 'package:meddly/features/setup/setup.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_required_fields_are_valid.g.dart';

@riverpod
bool requiredFieldsAreValid(RequiredFieldsAreValidRef ref) {
  return ref.watch(
    setupControllerProvider.select(
      (s) =>
          s.name.isValid &&
          s.lastname.isValid &&
          s.birthdate.isValid &&
          s.sex.isValid,
    ),
  );
}
