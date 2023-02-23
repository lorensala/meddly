// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MeasurementBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => MeasurementBloc(),
          child: MaterialApp(home: MeasurementBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
