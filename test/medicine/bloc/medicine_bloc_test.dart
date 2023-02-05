// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meddly/features/medicine/bloc/bloc.dart';

void main() {
  group('MedicineBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          MedicineBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final medicineBloc = MedicineBloc();
      expect(medicineBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<MedicineBloc, MedicineState>(
      'CustomMedicineEvent emits nothing',
      build: MedicineBloc.new,
      act: (bloc) => bloc.add(const CustomMedicineEvent()),
      expect: () => <MedicineState>[],
    );
  });
}
