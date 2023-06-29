import 'package:freezed_annotation/freezed_annotation.dart';

part 'prediction.freezed.dart';
part 'prediction.g.dart';

@freezed
class Prediction with _$Prediction {
  const factory Prediction({
    required String disease,
    required double probability,
  }) = _Prediction;

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);
}
