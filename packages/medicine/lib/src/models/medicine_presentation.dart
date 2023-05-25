// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

/// {@template medicine_presentation}
/// Medicine presentation.
/// {@endtemplate}
enum MedicinePresentation {
  /// {@macro medicine_presentation}
  capusle(isCommon: true),

  /// {@macro medicine_presentation}
  tablet(isCommon: true),

  /// {@macro medicine_presentation}
  liquid(isCommon: true),

  /// {@macro medicine_presentation}
  topical(isCommon: true),

  /// {@macro medicine_presentation}
  cream,

  /// {@macro medicine_presentation}
  device,

  /// {@macro medicine_presentation}
  drops,

  /// {@macro medicine_presentation}
  foam,

  /// {@macro medicine_presentation}
  gel,

  /// {@macro medicine_presentation}
  inhaler,

  /// {@macro medicine_presentation}
  injection,

  /// {@macro medicine_presentation}
  lotion,

  /// {@macro medicine_presentation}
  ointment,

  /// {@macro medicine_presentation}
  patch,

  /// {@macro medicine_presentation}
  powder,

  /// {@macro medicine_presentation}
  spray,

  /// {@macro medicine_presentation}
  suppository;

  /// {@macro medicine_presentation}
  const MedicinePresentation({this.isCommon = false});

  /// {@macro medicine_presentation}
  ///
  /// [isCommon] is true if the presentation is common.
  final bool isCommon;

  /// {@macro medicine_presentation}
  ///
  /// Returns a [MedicinePresentation] name from a [String] value.
  static MedicinePresentation fromString(String presentation) {
    return MedicinePresentation.values
            .firstWhereOrNull((mp) => mp.name == presentation) ??
        MedicinePresentation.capusle;
  }

  /// {@macro medicine_presentation}
  ///
  /// Returns a [List] of common [MedicinePresentation].
  static List<MedicinePresentation> get common {
    return MedicinePresentation.values.where((mp) => mp.isCommon).toList();
  }

  /// {@macro medicine_presentation}
  ///
  /// Returns a [List] of uncommon [MedicinePresentation].
  static List<MedicinePresentation> get uncommon {
    return MedicinePresentation.values.where((mp) => !mp.isCommon).toList();
  }
}
