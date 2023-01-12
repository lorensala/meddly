// ignore_for_file: prefer_const_constructors

import 'package:appointment/appointment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Appointment', () {
    test('can be instantiated', () {
      expect(Appointment(), isNotNull);
    });
  });
}
