import 'package:flutter/material.dart';
import 'package:meddly/features/predictions/widgets/predictions_body.dart';

class PredictionsPage extends StatelessWidget {
  const PredictionsPage({super.key});

  static const String routeName = '/predictions';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PredictionsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas orientativas'),
      ),
      body: const PredictionsBody(),
    );
  }
}
