import 'dart:io';

import 'package:predictions/src/api/api.dart';
import 'package:predictions/src/core/core.dart';
import 'package:predictions/src/models/models.dart';

class PredictionsRepository {
  const PredictionsRepository({required PredictionsApi api}) : _api = api;

  final PredictionsApi _api;

  Future<List<Symptom>> search(
    String query,
  ) async {
    return await _api.search(query);
  }

  Future<(PredictionException?, void)> verifyPredictionBySymptoms(
      {required Prediction prediction,
      required String disease,
      required bool approvalToSave}) async {
    try {
      await _api.verifyPredictionBySymptoms(
        prediction: prediction,
        disease: disease,
        approvalToSave: approvalToSave,
      );

      return (null, null);
    } on PredictionException catch (e) {
      return (e, null);
    } catch (e) {
      return (const PredictionUnknownException(), const <Disease>[]);
    }
  }

  Future<(PredictionException?, List<Disease>)> predictWithSymptoms(
      List<Symptom> symptoms) async {
    try {
      final predictions = await _api.predictWithSymptoms(symptoms);

      return (null, predictions);
    } on PredictionException catch (e) {
      return (e, const <Disease>[]);
    } catch (e) {
      return (const PredictionUnknownException(), const <Disease>[]);
    }
  }

  Future<(PredictionException?, List<Prediction>)>
      fetchPredictionsBySymptoms() async {
    try {
      final predictions = await _api.fetchPredictionsBySymptoms();
      return (null, predictions);
    } on PredictionException catch (e) {
      return (e, const <Prediction>[]);
    } catch (e) {
      return (const PredictionUnknownException(), const <Prediction>[]);
    }
  }

  Future<(PredictionException?, List<Disease>)> predictWithImage(
      File file) async {
    try {
      final predictions = await _api.predictWithImage(file);

      return (null, predictions);
    } on PredictionException catch (e) {
      return (e, const <Disease>[]);
    } catch (e) {
      return (const PredictionUnknownException(), const <Disease>[]);
    }
  }

  Future<void> cancel() async {
    await _api.cancel();
  }
}
