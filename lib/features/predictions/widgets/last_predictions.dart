import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/features/predictions/view/prediction_validate_page.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class LastPredictions extends ConsumerWidget {
  const LastPredictions({
    super.key,
  });

  static const int _lastConsultsCount = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consults = ref.watch(consultsProvider);

    return AsyncValueWidget(
      value: consults,
      builder: (consults) {
        if (consults.isEmpty) {
          return EmptyContainer(
            isFlex: false,
            size: context.height * 0.3,
            message: 'Aún no tienes consultas orientativas',
          );
        }

        final lastConsults = consults.take(_lastConsultsCount).toList();

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lastConsults.length,
          itemBuilder: (context, index) {
            final prediction = lastConsults[index];

            return ElevatedButton(
              onPressed: () => ref.read(goRouterProvider).push(
                    '${PredictionValidatePage.fullRouteName}/${prediction.id}',
                  ),
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.small),
                  color: context.colorScheme.secondary,
                  boxShadow: boxShadow(context),
                ),
                child: ListTile(
                  title: Text(
                    'Predicción por síntomas',
                    style: context.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    prediction.verified
                        ? 'Validada'
                        : 'Pendiente de validación',
                    style: context.textTheme.bodySmall?.copyWith(
                        // color: context.colorScheme.onBackground.withOpacity(0.5),
                        ),
                  ),
                  trailing: Text(
                    prediction.createdAt.localizedString(context),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onBackground.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: Sizes.medium,
          ),
        );
      },
    );
  }
}
