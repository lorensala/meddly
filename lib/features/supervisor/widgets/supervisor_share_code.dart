// ignore_for_file: leading_newlines_in_multiline_strings

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';

class SupervisorShareCode extends ConsumerWidget {
  const SupervisorShareCode({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider);

    return AsyncValueWidget(
      value: user,
      builder: (user) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              try {
                Share.share(inivitationText(user?.invitation));
              } catch (e) {
                showSnackBar(context, 'Error al compartir el código');
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.medium,
                vertical: Sizes.small,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Vectors.share,
                    height: Sizes.medium,
                    width: Sizes.medium,
                    colorFilter: ColorFilter.mode(
                      context.colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: Sizes.small),
                  Text(
                    'Compartir',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String inivitationText(String? code) {
    return '''
      Únete a Meddly y supervisa mi progreso. Pruebala ahora!
      Quería compartir contigo la aplicación Meddly que estoy usando para seguir mi progreso de salud. Me encantaría que te unas como persona "supervisora" para brindarme apoyo en mi cuidado.
      
      Código de invitación: $code

      Descarga la aplicación en [enlace de descarga de la aplicación para Android/iOS] y conéctate conmigo para comenzar.

      ¡Espero contar contigo en Meddly!
      ''';
  }
}
