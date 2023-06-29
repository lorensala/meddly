// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

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

                Navigator.of(context).pop();

                await ref
                    .read(predictionControllerProvider.notifier)
                    .predictWithImage(image);
              } catch (e) {
                await showSnackBar(context, context.l10n.cameraError);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(Sizes.medium),
              width: context.width,
              child: Row(
                children: [
                  SvgPicture.asset(Vectors.camera),
                  const SizedBox(width: Sizes.medium),
                  Text(
                    context.l10n.takePhoto,
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

                Navigator.of(context).pop();

                await ref
                    .read(predictionControllerProvider.notifier)
                    .predictWithImage(image);
              } catch (e) {
                await showSnackBar(context, context.l10n.galleryError);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(Sizes.medium),
              width: context.width,
              child: Row(
                children: [
                  SvgPicture.asset(Vectors.gallery),
                  const SizedBox(width: Sizes.medium),
                  Text(
                    context.l10n.openGallery,
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
