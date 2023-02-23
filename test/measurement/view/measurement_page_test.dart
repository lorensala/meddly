// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MeasurementPage', () {
    group('route', () {
      test('is routable', () {
        expect(MeasurementPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders MeasurementView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: MeasurementPage()));
      expect(find.byType(MeasurementView), findsOneWidget);
    });
  });
}
