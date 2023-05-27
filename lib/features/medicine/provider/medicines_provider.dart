import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:medicine/medicine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medicines_provider.g.dart';

@riverpod
class Medicines extends _$Medicines {
  @override
  Future<List<Medicine>> build() async {
    final repository = ref.read(medicineRepositoryProvider);

    final (err, medicines) = await repository.fetchAll();

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      throw Exception(err.describe(l10n));
    }

    return medicines;
  }
}
