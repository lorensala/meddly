import 'package:collection/collection.dart';

enum MedicineDosisUnit {
  mg(value: 'mg'),

  mcg(value: 'mcg'),

  g(value: 'g'),

  mL(value: 'mL'),

  percentage(value: '%');

  const MedicineDosisUnit({this.value = ''});

  final String value;

  static MedicineDosisUnit fromString(String value) {
    return MedicineDosisUnit.values.firstWhereOrNull(
          (element) => element.value == value,
        ) ??
        MedicineDosisUnit.mg;
  }
}
