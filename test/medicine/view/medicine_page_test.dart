// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MedicinePage', () {
    group('route', () {
      test('is routable', () {
        expect(MedicinePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders MedicineView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: MedicinePage()));
      expect(find.byType(MedicineView), findsOneWidget);
    });
  });
}
