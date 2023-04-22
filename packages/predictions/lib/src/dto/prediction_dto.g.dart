// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PredictionDto _$$_PredictionDtoFromJson(Map<String, dynamic> json) =>
    _$_PredictionDto(
      id: json['id'] as int,
      prediction: (json['prediction'] as List<dynamic>)
          .map((e) => DiseaseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      verified: json['verified'] as bool,
      symptoms:
          (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_PredictionDtoToJson(_$_PredictionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prediction': instance.prediction.map((e) => e.toJson()).toList(),
      'verified': instance.verified,
      'symptoms': instance.symptoms,
    };
