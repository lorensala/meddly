import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:predictions/src/core/core.dart';
import 'package:predictions/src/models/models.dart';

part 'symptom_dto.freezed.dart';
part 'symptom_dto.g.dart';

/// {@template symptom_search_result_dto}
/// Data transfer object for a symptom search result.
/// {@endtemplate}
@freezed
class SymptomDto with _$SymptomDto {
  /// {@macro symptom_search_result_dto}
  const factory SymptomDto({
    required String code,
    required String description,
  }) = _SymptomDto;

  /// {@macro symptom_search_result_dto}
  factory SymptomDto.fromJson(Map<String, dynamic> json) =>
      _$SymptomDtoFromJson(json);

  const SymptomDto._();

  /// Converts the [SymptomDto] to a [Symptom].
  ///
  /// Returns a [Symptom].
  /// Throws a [PredictionDtoException] if the conversion fails.
  Symptom toDomain() {
    try {
      return Symptom(
        code: code,
        description: description,
      );
    } on Exception {
      throw PredictionDtoException();
    }
  }

  /// Converts the [Symptom] to a [SymptomDto].
  ///
  /// Returns a [SymptomDto].
  /// Throws a [PredictionDtoException] if the conversion fails.
  factory SymptomDto.fromDomain(Symptom symptom) {
    try {
      return SymptomDto(
        code: symptom.code,
        description: symptom.description,
      );
    } on Exception {
      throw PredictionDtoException();
    }
  }
}
