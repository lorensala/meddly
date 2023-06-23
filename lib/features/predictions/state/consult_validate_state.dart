import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:predictions/predictions.dart';

part 'consult_validate_state.freezed.dart';

@freezed
class ConsultValidateState with _$ConsultValidateState {
  const factory ConsultValidateState({
    Disease? disease,
    @Default(false) bool isSearching,
    @Default(false) bool isAccepted,
  }) = _ConsultValidateState;
}
