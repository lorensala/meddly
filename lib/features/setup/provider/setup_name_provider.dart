import 'package:meddly/features/setup/controller/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'setup_name_provider.g.dart';

@riverpod
Name setupName(SetupNameRef ref) {
  return ref.watch(setupControllerProvider).name;
}
