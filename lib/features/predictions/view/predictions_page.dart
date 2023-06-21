import 'package:flutter/material.dart';
import 'package:meddly/features/predictions/widgets/predictions_body.dart';
import 'package:meddly/l10n/l10n.dart';

class PredictionsPage extends StatelessWidget {
  const PredictionsPage({super.key});

  static const String routeName = 'predictions';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PredictionsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.orientativeConsultations),
      ),
      body: const PredictionsBody(),
    );
  }
}
