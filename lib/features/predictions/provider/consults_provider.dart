// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:meddly/features/predictions/core/core.dart';
import 'package:meddly/features/predictions/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'consults_provider.g.dart';

@riverpod
class Consults extends _$Consults {
  @override
  Future<List<Consult>> build() async {
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final (err, consults) =
        await ref.read(predictionsRepositoryProvider).fetchConsults();

    if (err != null) {
      throw Exception(err.describe(l10n));
    }

    if (err != null) {
      throw Exception(err.describe(l10n));
    } else {
      return consults;
    }
  }

  Consult? getConsult(int id) {
    return state.maybeWhen(
      data: (consult) => consult.firstWhereOrNull(
        (c) => c.id == id,
      ),
      orElse: () => null,
    );
  }
}
