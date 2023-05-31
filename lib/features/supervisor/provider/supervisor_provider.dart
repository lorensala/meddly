import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supervisor/supervisor.dart';

part 'supervisor_provider.g.dart';

@riverpod
SupervisorApi supervisorApi(SupervisorApiRef ref) {
  return SupervisorApi(dio: ref.watch(dioProvider));
}

@riverpod
SupervisorRepository supervisorRepository(SupervisorRepositoryRef ref) {
  return SupervisorRepository(api: ref.watch(supervisorApiProvider));
}
