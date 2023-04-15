import 'package:meddly/features/setup/controller/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'setup_sex_provider.g.dart';

@riverpod
SexInput setupSex(SetupSexRef ref) {
  return ref.watch(setupControllerProvider).sex;
}
