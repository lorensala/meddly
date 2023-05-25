import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:predictions/predictions.dart';

part 'prediction.freezed.dart';

@freezed
class Prediction with _$Prediction {
  const factory Prediction({
    required int id,
    required List<Disease> prediction,
    required bool verified,
    required List<String> symptoms,
  }) = _Prediction;
}
