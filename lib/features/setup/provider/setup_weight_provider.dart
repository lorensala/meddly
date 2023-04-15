import 'package:meddly/features/setup/controller/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'setup_weight_provider.g.dart';

@riverpod
Weight setupWeight(SetupWeightRef ref) {
  return ref.watch(setupControllerProvider).weight;
}
