import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:predictions/src/core/core.dart';
import 'package:predictions/src/models/models.dart';

part 'symptom_search_result_dto.freezed.dart';
part 'symptom_search_result_dto.g.dart';

/// {@template symptom_search_result_dto}
/// Data transfer object for a symptom search result.
/// {@endtemplate}
@freezed
class SymptomSearchResultDto with _$SymptomSearchResultDto {
  /// {@macro symptom_search_result_dto}
  const factory SymptomSearchResultDto({
    required String code,
    required String description,
  }) = _SymptomSearchResultDto;

  /// {@macro symptom_search_result_dto}
  factory SymptomSearchResultDto.fromJson(Map<String, dynamic> json) =>
      _$SymptomSearchResultDtoFromJson(json);

  const SymptomSearchResultDto._();

  /// Converts the [SymptomSearchResultDto] to a [SymptomSearchResult].
  ///
  /// Returns a [SymptomSearchResult].
  /// Throws a [SymptomSearchResultDtoException] if the conversion fails.
  SymptomSearchResult toDomain() {
    try {
      return SymptomSearchResult(
        code: code,
        description: description,
      );
    } on Exception {
      throw SymptomSearchResultDtoException();
    }
  }
}
