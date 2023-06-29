import 'dart:io' show File;

import 'package:dio/dio.dart';
import 'package:predictions/src/api/api.dart';
import 'package:predictions/src/core/core.dart';
import 'package:predictions/src/models/models.dart';

class PredictionsRepository {
  const PredictionsRepository({required PredictionsApi api}) : _api = api;

  final PredictionsApi _api;

  Future<List<Symptom>> searchSymptoms(
    String query,
  ) async {
    return await _api.searchSymptoms(query);
  }

  Future<List<Disease>> searchDisease(
    String query,
  ) async {
    return await _api.searchDisease(query);
  }

  Future<(PredictionException?, void)> verifyConsultBySymptoms(
      {required Consult consult,
      required Disease disease,
      required bool approvalToSave}) async {
    try {
      await _api.verifyConsultBySymptoms(
        consult: consult,
        realDisease: disease.code,
        approvalToSave: approvalToSave,
      );

      return (null, null);
    } on PredictionException catch (e) {
      return (e, null);
    } catch (e) {
      return (const PredictionUnknownException(), null);
    }
  }

  Future<(PredictionException?, void)> verifyConsultByImage(
      {required Consult consult,
      required Disease disease,
      required bool approvalToSave}) async {
    try {
      await _api.verifyConsultByImage(
        consult: consult,
        realDisease: disease.code,
        approvalToSave: approvalToSave,
      );

      return (null, null);
    } on PredictionException catch (e) {
      return (e, null);
    } catch (e) {
      return (const PredictionUnknownException(), null);
    }
  }

  Future<(PredictionException?, List<Prediction>)> predictWithSymptoms(
      List<Symptom> symptoms) async {
    try {
      final predictions = await _api.predictWithSymptoms(symptoms);

      return (null, predictions);
    } on PredictionException catch (e) {
      return (e, const <Prediction>[]);
    } catch (e) {
      return (const PredictionUnknownException(), const <Prediction>[]);
    }
  }

  Future<(PredictionException?, List<Consult>)> _fetchConsultsByImage(
      {required CancelToken cancelToken}) async {
    try {
      final predictions =
          await _api.fetchConsultsByImage(cancelToken: cancelToken);
      return (null, predictions);
    } on PredictionException catch (e) {
      return (e, const <Consult>[]);
    } catch (e) {
      return (const PredictionUnknownException(), const <Consult>[]);
    }
  }

  Future<(PredictionException?, List<Consult>)> _fetchConsultsBySymptoms(
      {required CancelToken cancelToken}) async {
    try {
      final predictions =
          await _api.fetchConsultsBySymptoms(cancelToken: cancelToken);
      return (null, predictions);
    } on PredictionException catch (e) {
      return (e, const <Consult>[]);
    } catch (e) {
      return (const PredictionUnknownException(), const <Consult>[]);
    }
  }

  Future<(PredictionException?, List<Consult>)> fetchConsults(
      {required CancelToken cancelToken}) async {
    try {
      final (err1, consultsByImage) =
          await _fetchConsultsByImage(cancelToken: cancelToken);
      final (err2, consultsBySymtoms) =
          await _fetchConsultsBySymptoms(cancelToken: cancelToken);

      if (err1 != null) {
        return (err1, const <Consult>[]);
      }

      if (err2 != null) {
        return (err2, const <Consult>[]);
      }

      return (null, [...consultsByImage, ...consultsBySymtoms]);
    } on PredictionException catch (e) {
      return (e, const <Consult>[]);
    } catch (e) {
      return (const PredictionUnknownException(), const <Consult>[]);
    }
  }

  Future<(PredictionException?, List<Prediction>)> predictWithImage(
      File file) async {
    try {
      final predictions = await _api.predictWithImage(file);

      return (null, predictions);
    } on PredictionException catch (e) {
      return (e, const <Prediction>[]);
    } catch (e) {
      return (const PredictionUnknownException(), const <Prediction>[]);
    }
  }
}
