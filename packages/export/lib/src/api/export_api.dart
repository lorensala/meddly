import 'dart:io' show File, FileSystemException;

import 'package:dio/dio.dart';
import 'package:export/src/core/core.dart';

class ExportApi {
  const ExportApi({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<File> export(
      void Function(int, int)? onReceiveProgress, String savePath) async {
    late final Response<dynamic> res;

    try {
      res = await _dio.get<dynamic>(
        exportPath,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Accept': 'application/pdf',
          },
        ),
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        throw ExportConnectionException();
      } else if (e.type == DioErrorType.badResponse) {
        throw ExportSerializationException();
      } else {
        throw ExportUnknownException();
      }
    } catch (e) {
      throw ExportUnknownException();
    }

    try {
      final file = File(savePath);
      await file.writeAsBytes(res.data as List<int>, flush: true);
      return file;
    } on FileSystemException {
      throw ExportWriteException();
    } catch (e) {
      throw ExportUnknownException();
    }
  }
}
