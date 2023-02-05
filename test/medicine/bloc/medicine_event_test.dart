// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:meddly/features/medicine/bloc/bloc.dart';

void main() {
  group('MedicineEvent', () { 
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CustomMedicineEvent(),
          equals(const CustomMedicineEvent()),
        );
      });
    });
  });
}
