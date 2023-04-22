import 'package:meddly/features/predictions/provider/provider.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'predictions_repository_provider.g.dart';

@riverpod
PredictionsRepository predictionsRepository(PredictionsRepositoryRef ref) {
  return PredictionsRepository(api: ref.read(predictionsApiProvider));
}
