import 'package:freezed_annotation/freezed_annotation.dart';

part 'symptom.freezed.dart';
part 'symptom.g.dart';

@freezed
class Symptom with _$Symptom {
  const factory Symptom({
    required String code,
    required String description,
  }) = _Symptom;

  factory Symptom.fromJson(Map<String, dynamic> json) =>
      _$SymptomFromJson(json);
}
