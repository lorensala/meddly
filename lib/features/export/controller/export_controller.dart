import 'dart:io' show Platform;

import 'package:meddly/features/export/export.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'export_controller.g.dart';

@riverpod
class ExportController extends _$ExportController {
  @override
  ExportState build() {
    return const ExportInitial();
  }

  Future<void> exportPdf() async {
    state = const ExportLoading(progress: 0);
    final repository = ref.read(exportRepositoryProvider);

    try {
      final externalPath = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationSupportDirectory();

      final (err, file) = await repository.exportPdf(
        (count, total) {
          final progress = (count / total * 100).toInt();
          state = ExportLoading(progress: progress.toDouble());
        },
        externalPath!.path,
      );

      if (err != null) {
        state = ExportError(err.toString());
      } else {
        final hasStoragePermission = await _isStoragePermission();
        if (!hasStoragePermission) {
          state = const ExportError(
            'No se ha otorgado permiso de almacenamiento',
          );
          return;
        }
        if (file == null) {
          state = const ExportError(
            'No se ha podido exportar el archivo',
          );
          return;
        }

        state = ExportSuccess(file);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> _isStoragePermission() async {
    final isStorage = await Permission.storage.status;
    if (!isStorage.isGranted) {
      final newStatus = await Permission.storage.request();
      if (!newStatus.isGranted) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
