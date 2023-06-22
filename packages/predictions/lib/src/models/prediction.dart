import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:predictions/predictions.dart';

part 'prediction.freezed.dart';
part 'prediction.g.dart';

@freezed
class Prediction with _$Prediction {
  const factory Prediction({
    required int id,
    required List<Disease> prediction,
    required DateTime createdAt,
    required bool verified,
    required List<String> symptoms,
  }) = _Prediction;

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);
}
