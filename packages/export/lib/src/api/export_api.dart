import 'dart:io' show File, FileMode, FileSystemException;

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
      final file = File('${savePath}/meddly_export.pdf');
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(res.data as List<int>);
      await raf.close();
      return file;
    } on FileSystemException catch (e) {
      print(e);
      throw ExportWriteException();
    } catch (e) {
      throw ExportUnknownException();
    }
  }
}
