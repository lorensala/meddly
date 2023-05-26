import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:predictions/predictions.dart';

class PredictionsApi {
  PredictionsApi(Dio dio)
      : _cancelToken = CancelToken(),
        _dio = dio;

  final Dio _dio;
  final CancelToken _cancelToken;

  Future<List<Symptom>> search(String query) async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.post<List<dynamic>>(
        predictionsSearchPath,
        cancelToken: _cancelToken,
        queryParameters: {
          'symptom': query,
        },
      );
    } on DioError catch (e) {
      throw PredictionException.fromDioError(e);
    }

    try {
      if (res.data == null) return <Symptom>[];
      final results = res.data!;

      return results
          .map(
            (e) => Symptom.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw PredictionSerializationException();
    }
  }

  Future<List<Prediction>> fetchPredictionsBySymptoms() async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(
        predictionsWithSymptomsPath,
        cancelToken: _cancelToken,
      );

      if (res.statusCode == 401) {
        throw PredictionNotFoundException();
      }
    } on DioError catch (e) {
      throw PredictionException.fromDioError(e);
    }

    try {
      if (res.data == null) return <Prediction>[];
      final results = res.data!;

      return results
          .map(
            (e) => Prediction.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw PredictionSerializationException();
    }
  }

  Future<List<Disease>> predictWithSymptoms(List<Symptom> symptoms) async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.post<List<dynamic>>(
        predictionsWithSymptomsPath,
        cancelToken: _cancelToken,
        data: jsonEncode(symptoms.map((e) => e.code).toList()),
      );

      if (res.statusCode == 401) {
        throw PredictionNotFoundException();
      }
    } on DioError catch (e) {
      throw PredictionException.fromDioError(e);
    }

    try {
      if (res.data == null) return <Disease>[];
      final results = res.data!;

      return results
          .map(
            (e) => Disease.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw PredictionSerializationException();
    }
  }

  Future<void> cancel() async {
    _cancelToken.cancel();
  }
}
