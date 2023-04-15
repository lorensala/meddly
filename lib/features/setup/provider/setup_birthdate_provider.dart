import 'package:meddly/features/setup/controller/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'setup_birthdate_provider.g.dart';

@riverpod
Birthdate setupBirthdate(SetupBirthdateRef ref) {
  return ref.watch(setupControllerProvider).birthdate;
}
