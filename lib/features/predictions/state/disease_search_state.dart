import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'disease_search_state.freezed.dart';

@freezed
class DiseaseSearchState with _$DiseaseSearchState, FormzMixin {
  const factory DiseaseSearchState({
    @Default(Name.pure()) Name query,
  }) = _DiseaseSearchState;

  const DiseaseSearchState._();

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [query];
}
