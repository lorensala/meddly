// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meddly/features/measurement/bloc/bloc.dart';

void main() {
  group('MeasurementBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          MeasurementBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final measurementBloc = MeasurementBloc();
      expect(measurementBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<MeasurementBloc, MeasurementState>(
      'CustomMeasurementEvent emits nothing',
      build: MeasurementBloc.new,
      act: (bloc) => bloc.add(const CustomMeasurementEvent()),
      expect: () => <MeasurementState>[],
    );
  });
}
