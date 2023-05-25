import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:predictions/predictions.dart';
import 'package:validators/validators.dart';

part 'symptom_search_state.freezed.dart';

@freezed
class SymptomSearchState with _$SymptomSearchState {
  const factory SymptomSearchState({
    @Default(Name.pure()) Name query,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(<Symptom>[]) List<Symptom> results,
  }) = _SymptomSearchState;
}
