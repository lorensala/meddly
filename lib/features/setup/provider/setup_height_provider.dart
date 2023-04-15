import 'package:meddly/features/setup/controller/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'setup_height_provider.g.dart';

@riverpod
Height setupHeight(SetupHeightRef ref) {
  return ref.watch(setupControllerProvider).height;
}
