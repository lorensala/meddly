import 'package:meddly/features/setup/controller/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'setup_last_name_provider.g.dart';

@riverpod
Lastname setupLastname(SetupLastnameRef ref) {
  return ref.watch(setupControllerProvider).lastname;
}
