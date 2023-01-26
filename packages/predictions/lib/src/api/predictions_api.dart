import 'package:dio/dio.dart';
import 'package:predictions/src/core/core.dart';

/// {@template predictions_api}
/// API for predictions operations.
/// {@endtemplate}
class PredictionsApi {
  /// {@macro predictions_api}
  PredictionsApi(Dio dio, {String? baseUrl})
      : _cancelToken = CancelToken(),
        _dio = dio {
    _dio.options.baseUrl = baseUrl ?? _dio.options.baseUrl;
  }

  final Dio _dio;
  final CancelToken _cancelToken;

  /// Searches for predictions.
  ///
  /// Throws a [PredictionNotFoundException] if the search is not found.\
  /// Throws a [PredictionDioException] if any other DioError occurs.
  /// Throws a [PredictionSerializationException] if the response cannot be
  /// serialized.
  Future<List<String>> search(String query) async {
    late final Response<Map<String, dynamic>> res;
    try {
      res = await _dio.post<Map<String, dynamic>>(
        predictionsPath,
        cancelToken: _cancelToken,
        queryParameters: {
          'symptom': query,
        },
      );

      if (res.statusCode == 401) {
        throw PredictionNotFoundException();
      }
    } on DioError catch (e) {
      throw PredictionDioException(e);
    }

    try {
      if (res.data == null) return <String>[];
      final results = res.data!['results'] as List<dynamic>;

      return results.map((e) => e as String).toList();
    } catch (e) {
      throw PredictionSerializationException();
    }
  }

  /// Cancels the current request.
  Future<void> cancel() async {
    _cancelToken.cancel();
  }
}
