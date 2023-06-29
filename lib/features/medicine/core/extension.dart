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

extension MedicinePresentationX on MedicinePresentation {
  String localizedString(AppLocalizations l10n) {
    return switch (this) {
      MedicinePresentation.capsule => l10n.medicinePresentationCapsule,
      MedicinePresentation.tablet => l10n.medicinePresentationTablet,
      MedicinePresentation.liquid => l10n.medicinePresentationLiquid,
      MedicinePresentation.topical => l10n.medicinePresentationTopical,
      MedicinePresentation.cream => l10n.medicinePresentationCream,
      MedicinePresentation.device => l10n.medicinePresentationDevice,
      MedicinePresentation.drops => l10n.medicinePresentationDrops,
      MedicinePresentation.foam => l10n.medicinePresentationFoam,
      MedicinePresentation.gel => l10n.medicinePresentationGel,
      MedicinePresentation.inhaler => l10n.medicinePresentationInhaler,
      MedicinePresentation.injection => l10n.medicinePresentationInjection,
      MedicinePresentation.lotion => l10n.medicinePresentationLotion,
      MedicinePresentation.ointment => l10n.medicinePresentationOintment,
      MedicinePresentation.patch => l10n.medicinePresentationPatch,
      MedicinePresentation.powder => l10n.medicinePresentationPowder,
      MedicinePresentation.spray => l10n.medicinePresentationSpray,
      MedicinePresentation.suppository => l10n.medicinePresentationSuppository,
    };
  }
}

extension MedicineDayX on MedicineDay {
  String localizedString(AppLocalizations l10n) {
    return switch (this) {
      MedicineDay.monday => l10n.monday,
      MedicineDay.tuesday => l10n.tuesday,
      MedicineDay.wednesday => l10n.wednesday,
      MedicineDay.thursday => l10n.thursday,
      MedicineDay.friday => l10n.friday,
      MedicineDay.saturday => l10n.saturday,
      MedicineDay.sunday => l10n.sunday,
    };
  }
}
