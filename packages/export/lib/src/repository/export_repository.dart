import 'dart:io' show File;

import 'package:export/src/api/api.dart';
import 'package:export/src/core/core.dart';

class ExportRepository {
  const ExportRepository({required ExportApi api}) : _api = api;

  final ExportApi _api;

  Future<(ExportException?, File?)> exportPdf(
      void Function(int, int)? onReceiveProgress, String savePath) async {
    try {
      final file = await _api.export(
        onReceiveProgress,
        savePath,
      );

      return (null, file);
    } on ExportException catch (e) {
      return (e, null);
    } catch (e) {
      return (ExportUnknownException(), null);
    }
  }
}
