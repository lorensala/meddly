import 'package:meddly/l10n/l10n.dart';
import 'package:medicine/medicine.dart';

extension MedicineFailureX on MedicineException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      MedicineUnknownException() => l10n.unknownError,
      MedicineNotFoundException() => l10n.medicineNotFound,
      MedicineNotYoursException() => l10n.unknownError,
      MedicineConnectionException() => l10n.connectionError,
      MedicineCancelException() => l10n.unknownError,
      MedicineSerializationException() => l10n.unknownError,
      MedicineInvalidException() => l10n.unknownError,
      MedicineModelConversionException() => l10n.unknownError,
      MedicineCacheException() => l10n.unknownError,
    };
  }
}
