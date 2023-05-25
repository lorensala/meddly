// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseDto _$$_DiseaseDtoFromJson(Map<String, dynamic> json) =>
    _$_DiseaseDto(
      disease: json['disease'] as String,
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$$_DiseaseDtoToJson(_$_DiseaseDto instance) =>
    <String, dynamic>{
      'disease': instance.disease,
      'probability': instance.probability,
    };
