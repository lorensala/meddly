// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:meddly/features/medicine/bloc/bloc.dart';

void main() {
  group('MedicineState', () {
    test('supports value equality', () {
      expect(
        MedicineState(),
        equals(
          const MedicineState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const MedicineState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const medicineState = MedicineState(
            customProperty: 'My property',
          );
          expect(
            medicineState.copyWith(),
            equals(medicineState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const medicineState = MedicineState(
            customProperty: 'My property',
          );
          final otherMedicineState = MedicineState(
            customProperty: 'My property 2',
          );
          expect(medicineState, isNot(equals(otherMedicineState)));

          expect(
            medicineState.copyWith(
              customProperty: otherMedicineState.customProperty,
            ),
            equals(otherMedicineState),
          );
        },
      );
    });
  });
}
