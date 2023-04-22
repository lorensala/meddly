import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:predictions/src/core/core.dart';
import 'package:predictions/src/models/models.dart';

part 'disease_dto.freezed.dart';
part 'disease_dto.g.dart';

@freezed
class DiseaseDto with _$DiseaseDto {
  const factory DiseaseDto({
    required String disease,
    required double probability,
  }) = _DiseaseDto;

  factory DiseaseDto.fromJson(Map<String, dynamic> json) =>
      _$DiseaseDtoFromJson(json);

  const DiseaseDto._();

  Disease toModel() {
    try {
      return Disease(
        disease: disease,
        probability: probability,
      );
    } catch (_) {
      throw PredictionDtoException();
    }
  }

  factory DiseaseDto.fromModel(Disease disease) {
    return DiseaseDto(
      disease: disease.disease,
      probability: disease.probability,
    );
  }
}
