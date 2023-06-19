import 'package:meddly/features/supervisor/core/core.dart';
import 'package:meddly/features/supervisor/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'supervisor_controller.g.dart';

@riverpod
class SupervisorController extends _$SupervisorController {
  @override
  Future<({List<User> supervisors, List<User> supervised})> build() async {
    final repository = ref.watch(supervisorRepositoryProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    final (err1, supervisors) = await repository.getSupervisors();
    final (err2, supervised) = await repository.getSupervised();

    if (err1 != null) {
      throw Exception(err1.describe(l10n));
    }

    if (err2 != null) {
      throw Exception(err2.describe(l10n));
    }

    return (supervisors: supervisors, supervised: supervised);
  }

  Future<void> acceptInvitation(String code) async {
    final repository = ref.watch(supervisorRepositoryProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    state = const AsyncLoading();

    final (err, _) = await repository.acceptInvitation(code);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
    ref.invalidateSelf();
  }

  Future<void> deleteSupervisor(String id) async {
    final repository = ref.watch(supervisorRepositoryProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    state = const AsyncLoading();

    final (err, _) = await repository.deleteSupervisor(id);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
    ref.invalidateSelf();
  }

  Future<void> deleteSupervised(String id) async {
    final repository = ref.watch(supervisorRepositoryProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    state = const AsyncLoading();

    final (err, _) = await repository.deleteSupervised(id);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
    ref.invalidateSelf();
  }
}
