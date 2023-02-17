import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:meddly/features/medicine/bloc/bloc.dart';
import 'package:meddly/features/medicine/cubit/medicine_form_cubit.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';
import 'package:meddly/features/user/view/user_page.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template medicine_page}
/// A description for MedicineReviewDetailsPage
/// {@endtemplate}
class MedicineReviewDetailsPage extends StatelessWidget {
  /// {@macro medicine_page}
  const MedicineReviewDetailsPage({super.key});

  /// The static route for MedicineReviewDetailsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicineReviewDetailsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicineBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Medicine'),
        ),
        body: const MedicineReviewDetailsView(),
      ),
    );
  }
}

/// {@template medicine_view}
/// Displays the Body of MedicineView
/// {@endtemplate}
class MedicineReviewDetailsView extends StatelessWidget {
  /// {@macro medicine_view}
  const MedicineReviewDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicineFormCubit, MedicineFormState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context)
              .pushAndRemoveUntil(UserPage.route(), (_) => false);
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.failure!.maybeWhen(
                    orElse: () => context.l10n.unknownError,
                    sendTimeout: () => context.l10n.timeout,
                    receiveTimeout: () => context.l10n.timeout,
                    connectionTimeOut: () => context.l10n.timeout,
                    response: () => context.l10n.serverError,
                  ),
                ),
              ),
            );
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const MedicineReviewDetails(),
      ),
    );
  }
}
