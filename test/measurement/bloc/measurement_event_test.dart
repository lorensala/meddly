// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:meddly/features/measurement/bloc/bloc.dart';

void main() {
  group('MeasurementEvent', () { 
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CustomMeasurementEvent(),
          equals(const CustomMeasurementEvent()),
        );
      });
    });
  });
}
