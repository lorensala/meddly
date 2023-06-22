import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'symptom_search_state.freezed.dart';

@freezed
class SymptomSearchState with _$SymptomSearchState, FormzMixin {
  const factory SymptomSearchState({
    @Default(Name.pure()) Name query,
  }) = _SymptomSearchState;

  const SymptomSearchState._();

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [query];
}
