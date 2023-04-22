import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';

class PredictionsSymptomsSearchPage extends ConsumerWidget {
  const PredictionsSymptomsSearchPage({super.key});

  static const String routeName = '/predictions/symptom/search';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(symptomSearchControllerProvider, (_, state) {
      if (state.status == FormzStatus.submissionFailure) {
        showSnackBar(context, context.l10n.unknownError);
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Search'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: EdgeInsets.all(Sizes.medium),
            child: PredictionsSymptomsSearchField(),
          ),
        ),
      ),
      body: const PredictionsSymptomsSearchBody(),
    );
  }
}
