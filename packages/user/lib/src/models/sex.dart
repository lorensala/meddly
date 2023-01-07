import 'package:freezed_annotation/freezed_annotation.dart';

part 'sex.freezed.dart';

/// {@template sex}
/// Model for sex atribute
/// {@endtemplate}
@freezed
class Sex with _$Sex {
  /// bool to Sex model
  factory Sex.fromBool({bool? value}) {
    if (value == null) return const Sex.male();
    return value ? const Sex.male() : const Sex.female();
  }

  /// {@macro sex}
  const factory Sex.male() = Male;

  /// {@macro sex}
  const factory Sex.female() = Female;

  const Sex._();

  /// Sex model to bool
  bool toBool() {
    return when(male: () => true, female: () => false);
  }
}
