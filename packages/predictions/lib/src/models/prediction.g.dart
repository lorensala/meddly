// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Prediction _$$_PredictionFromJson(Map<String, dynamic> json) =>
    _$_Prediction(
      disease: json['disease'] as String,
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PredictionToJson(_$_Prediction instance) =>
    <String, dynamic>{
      'disease': instance.disease,
      'probability': instance.probability,
    };
