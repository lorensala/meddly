import 'package:meddly/features/setup/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_required_fields_are_valid.g.dart';

@riverpod
bool requiredFieldsAreValid(RequiredFieldsAreValidRef ref) {
  final name = ref.watch(setupNameProvider);
  final lastname = ref.watch(setupLastnameProvider);
  final sex = ref.watch(setupSexProvider);
  final birthdate = ref.watch(setupBirthdateProvider);

  return name.valid && lastname.valid && birthdate.valid && sex.valid;
}
