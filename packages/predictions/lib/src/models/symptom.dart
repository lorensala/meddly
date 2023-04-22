import 'package:freezed_annotation/freezed_annotation.dart';

part 'symptom.freezed.dart';

@freezed
class Symptom with _$Symptom {
  const factory Symptom({
    required String code,
    required String description,
  }) = _Symptom;
}
