// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Prediction _$$_PredictionFromJson(Map<String, dynamic> json) =>
    _$_Prediction(
      id: json['id'] as int,
      prediction: (json['prediction'] as List<dynamic>)
          .map((e) => Disease.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      verified: json['verified'] as bool,
      symptoms:
          (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_PredictionToJson(_$_Prediction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prediction': instance.prediction.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt.toIso8601String(),
      'verified': instance.verified,
      'symptoms': instance.symptoms,
    };
