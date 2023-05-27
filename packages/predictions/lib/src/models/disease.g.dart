// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Disease _$$_DiseaseFromJson(Map<String, dynamic> json) => _$_Disease(
      disease: json['disease'] as String,
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$$_DiseaseToJson(_$_Disease instance) =>
    <String, dynamic>{
      'disease': instance.disease,
      'probability': instance.probability,
    };
