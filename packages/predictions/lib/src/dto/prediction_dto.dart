import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:predictions/src/core/core.dart';
import 'package:predictions/src/dto/dto.dart';
import 'package:predictions/src/models/models.dart';

part 'prediction_dto.freezed.dart';
part 'prediction_dto.g.dart';

@freezed
class PredictionDto with _$PredictionDto {
  const factory PredictionDto({
    required int id,
    required List<DiseaseDto> prediction,
    required bool verified,
    required List<String> symptoms,
  }) = _PredictionDto;

  factory PredictionDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionDtoFromJson(json);

  const PredictionDto._();

  Prediction toModel() {
    try {
      return Prediction(
        id: id,
        prediction: prediction.map((e) => e.toModel()).toList(),
        verified: verified,
        symptoms: symptoms,
      );
    } on Exception {
      throw PredictionDtoException();
    }
  }

  factory PredictionDto.fromModel(Prediction prediction) {
    try {
      return PredictionDto(
        id: prediction.id,
        prediction:
            prediction.prediction.map((e) => DiseaseDto.fromModel(e)).toList(),
        verified: prediction.verified,
        symptoms: prediction.symptoms,
      );
    } on Exception {
      throw PredictionDtoException();
    }
  }
}
