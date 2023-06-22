import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
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
          'query': query,
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

  Future<void> verifyPredictionBySymptoms({
    required Prediction prediction,
    required String disease,
    required bool approvalToSave,
  }) async {
    try {
      await _dio.post<dynamic>(
        '${predictionsVerifySymptomsPath}/${prediction.id}',
        cancelToken: _cancelToken,
        queryParameters: {
          'real_disease': disease,
          'approval_to_save': approvalToSave,
        },
      );
    } on DioError catch (e) {
      throw PredictionException.fromDioError(e);
    } catch (e) {
      throw PredictionUnknownException();
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

  Future<List<Disease>> predictWithImage(File file) async {
    late final Response<List<dynamic>> res;
    try {
      final fileName = file.path.split('/').last;

      var fileExt = fileName.split('.').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType("image", fileExt),
        ),
      });
      res = await _dio.post<List<dynamic>>(
        predictionsWithImagePath,
        cancelToken: _cancelToken,
        data: formData,
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
