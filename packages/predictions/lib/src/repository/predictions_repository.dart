import 'package:dartz/dartz.dart';
import 'package:predictions/src/api/api.dart';
import 'package:predictions/src/core/core.dart';
import 'package:predictions/src/dto/dto.dart';
import 'package:predictions/src/models/models.dart';

/// {@template predictions_repository}
/// Repository for predictions operations.
/// {@endtemplate}
class PredictionsRepository {
  /// {@macro predictions_repository}
  const PredictionsRepository({required PredictionsApi api}) : _api = api;

  final PredictionsApi _api;

  /// Searches for predictions.
  ///
  /// Returns a [List] of [String] if the search is successful.
  /// Returns a [PredictionFailure] if the search is not successful.
  Future<Either<PredictionFailure, List<Symptom>>> search(
    String query,
  ) async {
    try {
      final predictions = await _api.search(query);
      return right(predictions.map((e) => e.toDomain()).toList());
    } on PredictionNotFoundException {
      return left(const PredictionFailure.notFound());
    } on PredictionDioException {
      return left(const PredictionFailure.response());
    } on PredictionSerializationException {
      return left(const PredictionFailure.serialization());
    } on PredictionDtoException {
      return left(const PredictionFailure.serialization());
    }
  }

  Future<Either<PredictionFailure, List<Disease>>> predictWithSymptoms(
      List<Symptom> symptoms) async {
    try {
      final symptomsDto = symptoms.map(SymptomDto.fromDomain).toList();
      final predictions = await _api.predictWithSymptoms(symptomsDto);

      return right(predictions.map((e) => e.toModel()).toList());
    } on PredictionNotFoundException {
      return left(const PredictionFailure.notFound());
    } on PredictionDioException {
      return left(const PredictionFailure.response());
    } on PredictionSerializationException {
      return left(const PredictionFailure.serialization());
    } on PredictionDtoException {
      return left(const PredictionFailure.serialization());
    }
  }

  Future<Either<PredictionFailure, List<Prediction>>>
      fetchPredictionsBySymptoms() async {
    try {
      final predictions = await _api.fetchPredictionsBySymptoms();
      return right(predictions.map((e) => e.toModel()).toList());
    } on PredictionNotFoundException {
      return left(const PredictionFailure.notFound());
    } on PredictionDioException {
      return left(const PredictionFailure.response());
    } on PredictionSerializationException {
      return left(const PredictionFailure.serialization());
    } on PredictionDtoException {
      return left(const PredictionFailure.serialization());
    }
  }

  /// Cancels the current request.
  Future<void> cancel() async {
    await _api.cancel();
  }
}
