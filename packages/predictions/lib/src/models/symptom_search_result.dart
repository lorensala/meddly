import 'package:freezed_annotation/freezed_annotation.dart';

part 'symptom_search_result.freezed.dart';

/// {@template symptom_search_result}
/// Model for a symptom search result.
/// {@endtemplate}
@freezed
class SymptomSearchResult with _$SymptomSearchResult {
  /// {@macro symptom_search_result}
  const factory SymptomSearchResult({
    required String code,
    required String description,
  }) = _SymptomSearchResult;
}
