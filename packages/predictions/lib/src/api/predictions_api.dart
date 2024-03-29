import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:predictions/predictions.dart';

class PredictionsApi {
  PredictionsApi(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<List<Symptom>> searchSymptoms(String query) async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(
        predictionsSymptomSearchPath,
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

  Future<List<Disease>> searchDisease(String query) async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(
        predictionsDiseaseSearchPath,
        queryParameters: {
          'query': query,
        },
      );
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

  Future<void> verifyConsultBySymptoms({
    required Consult consult,
    required String realDisease,
    required bool approvalToSave,
  }) async {
    try {
      await _dio.post<dynamic>(
        '${predictionsVerifySymptomsPath}/${consult.id}',
        queryParameters: {
          'real_disease': realDisease,
          'approval_to_save': approvalToSave,
        },
      );
    } on DioError catch (e) {
      throw PredictionException.fromDioError(e);
    } catch (e) {
      throw PredictionUnknownException();
    }
  }

  Future<void> verifyConsultByImage({
    required Consult consult,
    required String realDisease,
    required bool approvalToSave,
  }) async {
    try {
      await _dio.post<dynamic>(
        '${predictionsVerifyImagePath}/${consult.id}',
        queryParameters: {
          'real_disease': realDisease,
          'approval_to_save': approvalToSave,
        },
      );
    } on DioError catch (e) {
      throw PredictionException.fromDioError(e);
    } catch (e) {
      throw PredictionUnknownException();
    }
  }

  Future<List<Consult>> fetchConsultsBySymptoms(
      {required CancelToken cancelToken}) async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(
        predictionsWithSymptomsPath,
        cancelToken: cancelToken,
      );

      if (res.statusCode == 401) {
        throw PredictionNotFoundException();
      }
    } on DioError catch (e) {
      throw PredictionException.fromDioError(e);
    }

    try {
      if (res.data == null) return <Consult>[];
      final results = res.data!;

      return results
          .map(
            (e) => Consult.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw PredictionSerializationException();
    }
  }

  Future<List<Consult>> fetchConsultsByImage(
      {required CancelToken cancelToken}) async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(
        predictionsWithImagePath,
        cancelToken: cancelToken,
      );

      if (res.statusCode == 401) {
        throw PredictionNotFoundException();
      }
    } on DioError catch (e) {
      throw PredictionException.fromDioError(e);
    }

    try {
      if (res.data == null) return <Consult>[];
      final results = res.data!;

      return results
          .map(
            (e) => Consult.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw PredictionSerializationException();
    }
  }

  Future<List<Prediction>> predictWithSymptoms(List<Symptom> symptoms) async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.post<List<dynamic>>(
        predictionsWithSymptomsPath,
        data: jsonEncode(symptoms.map((e) => e.code).toList()),
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

  Future<List<Prediction>> predictWithImage(File file) async {
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
        data: formData,
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
}
