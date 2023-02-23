// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:meddly/features/measurement/bloc/bloc.dart';

void main() {
  group('MeasurementState', () {
    test('supports value equality', () {
      expect(
        MeasurementState(),
        equals(
          const MeasurementState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const MeasurementState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const measurementState = MeasurementState(
            customProperty: 'My property',
          );
          expect(
            measurementState.copyWith(),
            equals(measurementState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const measurementState = MeasurementState(
            customProperty: 'My property',
          );
          final otherMeasurementState = MeasurementState(
            customProperty: 'My property 2',
          );
          expect(measurementState, isNot(equals(otherMeasurementState)));

          expect(
            measurementState.copyWith(
              customProperty: otherMeasurementState.customProperty,
            ),
            equals(otherMeasurementState),
          );
        },
      );
    });
  });
}
