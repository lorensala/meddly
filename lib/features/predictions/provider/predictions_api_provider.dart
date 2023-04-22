import 'package:meddly/provider/provider.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'predictions_api_provider.g.dart';

@riverpod
PredictionsApi predictionsApi(PredictionsApiRef ref) {
  return PredictionsApi(ref.read(dioProvider));
}
