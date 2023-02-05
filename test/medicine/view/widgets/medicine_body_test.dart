// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MedicineBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => MedicineBloc(),
          child: MaterialApp(home: MedicineBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
