import 'package:freezed_annotation/freezed_annotation.dart';

part 'disease.freezed.dart';
part 'disease.g.dart';

@freezed
class Disease with _$Disease {
  const factory Disease({
    required String code,
    required String description,
  }) = _Disease;

  factory Disease.fromJson(Map<String, dynamic> json) =>
      _$DiseaseFromJson(json);
}
