// ignore_for_file: use_setters_to_change_properties

import 'package:meddly/features/predictions/predictions.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'consult_validate_controller.g.dart';

@Riverpod(dependencies: [consult])
class ConsultValidateController extends _$ConsultValidateController {
  @override
  ConsultValidateState build() {
    return const ConsultValidateState();
  }

  void selectDisease(Disease disease) {
    state = state.copyWith(disease: disease, isSearching: false);
  }

  void clear() {
    state = const ConsultValidateState();
  }

  void isSearching({required bool value}) {
    state = state.copyWith(isSearching: value);
  }

  void isAccepted({required bool value}) {
    state = state.copyWith(isAccepted: value);
  }

  void validate() {
    if (state.disease == null) return;

    final consult = ref.watch(consultProvider);
    ref.read(predictionControllerProvider.notifier).validate(
          consult: consult,
          disease: state.disease!,
          approvalToSave: state.isAccepted,
        );
  }
}
