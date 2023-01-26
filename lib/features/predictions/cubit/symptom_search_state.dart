part of 'symptom_search_cubit.dart';

@freezed
class SymptomSearchState with _$SymptomSearchState {
  const factory SymptomSearchState({
    @Default(Name.pure()) Name query,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(<String>[]) List<String> results,
  }) = _SymptomSearchState;
}
