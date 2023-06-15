// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

enum MedicinePresentation {
  capsule(isCommon: true),

  tablet(isCommon: true),

  liquid(isCommon: true),

  topical(isCommon: true),

  cream,

  device,

  drops,

  foam,

  gel,

  inhaler,

  injection,

  lotion,

  ointment,

  patch,

  powder,

  spray,

  suppository;

  const MedicinePresentation({this.isCommon = false});

  final bool isCommon;

  static MedicinePresentation fromString(String presentation) {
    return MedicinePresentation.values
            .firstWhereOrNull((mp) => mp.name == presentation) ??
        MedicinePresentation.capsule;
  }

  static List<MedicinePresentation> get common {
    return MedicinePresentation.values.where((mp) => mp.isCommon).toList();
  }

  static List<MedicinePresentation> get uncommon {
    return MedicinePresentation.values.where((mp) => !mp.isCommon).toList();
  }
}
