import 'package:flutter/material.dart';
import 'package:meddly/features/measurement/measurement.dart';

class MeasurementFormPage extends StatelessWidget {
  const MeasurementFormPage({super.key});

  static String routeName = 'measurement_form';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mediciones'),
      ),
      body: const MeasurementForm(),
    );
  }
}
