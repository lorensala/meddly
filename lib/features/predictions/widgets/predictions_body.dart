import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class PredictionsBody extends ConsumerWidget {
  const PredictionsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PredictionCard(
              title: context.l10n.imageScan,
              description: context.l10n.imageScanDescription,
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  useRootNavigator: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(Sizes.medium),
                    ),
                  ),
                  builder: (_) {
                    return const ImagePickerBottomSheet();
                  },
                );
              },
              vector: Vectors.medicines,
            ),
            const SizedBox(height: Sizes.medium),
            PredictionCard(
              title: context.l10n.enterSympthoms,
              description: context.l10n.enterSympthomsDescription,
              onTap: () => ref.read(goRouterProvider).push(
                    '${BrowsePage.routeName}/${PredictionsPage.routeName}/${PredictionSymptomsPage.routeName}',
                  ),
              vector: Vectors.measurements,
            ),
            const SizedBox(height: Sizes.large),
            Text(
              'Ultimas consultas',
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: Sizes.large),
            const LastPredictions(),
          ],
        ),
      ),
    );
  }
}

class ImagePickerBottomSheet extends ConsumerWidget {
  const ImagePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      predictionControllerProvider,
      (_, state) {
        state.whenOrNull(
          error: (err, _) {
            showSnackBar(context, err.toString());
          },
        );
      },
    );

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: Sizes.medium),
          const BottomSheetDecoration(),
          const SizedBox(height: Sizes.medium),
          GestureDetector(
            onTap: () async {
              try {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.camera);

                if (image == null) return;

                await ref
                    .read(predictionControllerProvider.notifier)
                    .predictWithImage(image);
              } catch (e) {
                await showSnackBar(context, 'Error al abrir la cámara');
              }

              ref.read(goRouterProvider).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(Sizes.medium),
              width: context.width,
              child: Row(
                children: [
                  SvgPicture.asset(Vectors.camera),
                  const SizedBox(width: Sizes.medium),
                  Text(
                    'Abrir cámara',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              try {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (image == null) return;

                await ref
                    .read(predictionControllerProvider.notifier)
                    .predictWithImage(image);
              } catch (e) {
                await showSnackBar(context, 'Error al abrir la galería');
              }
              ref.read(goRouterProvider).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(Sizes.medium),
              width: context.width,
              child: Row(
                children: [
                  SvgPicture.asset(Vectors.gallery),
                  const SizedBox(width: Sizes.medium),
                  Text(
                    'Seleccionar de la galería',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: Sizes.large),
        ],
      ),
    );
  }
}
