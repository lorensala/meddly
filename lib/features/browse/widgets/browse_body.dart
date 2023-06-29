import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';

class BrowseBody extends ConsumerWidget {
  const BrowseBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BrowseCard(
              title: context.l10n.measurements,
              description: context.l10n.measurementsDescription,
              vector: Vectors.measurement,
              onTap: () => ref
                  .read(goRouterProvider)
                  .push('${BrowsePage.routeName}/${MeasurementPage.routeName}'),
            ),
            const SizedBox(height: Sizes.medium),
            BrowseCard(
              title: context.l10n.orientativeConsultations,
              description: context.l10n.orientativeConsultationsDescription,
              vector: Vectors.consult,
              onTap: () => ref.read(goRouterProvider).push(
                    '${BrowsePage.routeName}/${PredictionsPage.routeName}',
                  ),
            ),
            const SizedBox(height: Sizes.medium),
            BrowseCard(
              title: context.l10n.medicines,
              description: context.l10n.medicinesDescriptions,
              vector: Vectors.medicine,
              onTap: () => ref
                  .read(goRouterProvider)
                  .push('${BrowsePage.routeName}/${MedicinePage.routeName}'),
            ),
            const SizedBox(height: Sizes.medium),
            BrowseCard(
              title: context.l10n.appointments,
              description: context.l10n.appointmentDescription,
              vector: Vectors.appointment,
              onTap: () => ref
                  .read(goRouterProvider)
                  .push('${BrowsePage.routeName}/${AppointmentPage.routeName}'),
            ),
            const SizedBox(height: Sizes.medium),
            BrowseCard(
              title: context.l10n.linkedAccounts,
              description: context.l10n.linkedAccountsDescription,
              vector: Vectors.linkedAccount,
              onTap: () => ref
                  .read(goRouterProvider)
                  .push('${BrowsePage.routeName}/${SupervisorPage.routeName}'),
            ),
          ],
        ),
      ),
    );
  }
}
