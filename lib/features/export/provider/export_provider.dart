import 'package:export/export.dart';
import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'export_provider.g.dart';

@riverpod
ExportApi exportApi(ExportApiRef ref) {
  return ExportApi(dio: ref.read(dioProvider));
}

@riverpod
ExportRepository exportRepository(ExportRepositoryRef ref) {
  return ExportRepository(api: ref.read(exportApiProvider));
}
