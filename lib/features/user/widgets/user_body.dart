import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/notifications/view/view.dart';
import 'package:meddly/features/settings/settings.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/widgets/widgets.dart';

class UserBody extends ConsumerWidget {
  const UserBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userControllerProvider);

    return AsyncValueWidget(
      value: userStream,
      builder: (user) {
        if (user == null) {
          return const Text('No user');
        }

        return Padding(
          padding: const EdgeInsets.all(Sizes.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Sizes.medium),
              Row(
                children: [
                  const UserAvatar(radius: 30),
                  const SizedBox(width: Sizes.medium),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.firstName} ${user.lastName}',
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        user.email,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: Sizes.extraLarge),
              Text(
                'CUENTA',
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: Sizes.medium),
              const SettingsItem(
                vector: Vectors.user,
                label: 'Modificar mis datos',
              ),
              const SizedBox(height: Sizes.medium),
              const SettingsItem(
                vector: Vectors.changePassword,
                label: 'Cambiar contraseña',
              ),
              const SizedBox(height: Sizes.extraLarge),
              Text(
                'AJUSTES',
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: Sizes.medium),
              SettingsItem(
                vector: Vectors.bellRinging,
                label: 'Preferencia de notificaciones',
                onPressed: () {
                  GoRouter.of(context).push(
                    '${UserPage.routeName}/${NotificationsPreferencesPage.routeName}',
                  );
                },
              ),
              const SizedBox(height: Sizes.medium),
              SettingsItem(
                vector: Vectors.pdf,
                label: 'Exportar mis datos',
                onPressed: () {},
              ),
              const SizedBox(height: Sizes.medium),
              SettingsItem(
                vector: Vectors.about,
                label: 'Sobre Meddly',
                onPressed: () async {
                  await showDialog<void>(
                    context: context,
                    builder: (context) {
                      return AboutDialog(
                        applicationName: 'Meddly',
                        applicationIcon: SvgPicture.asset(Vectors.logo),
                        applicationVersion: 'v1.0.0',
                        applicationLegalese: '@2023 Meddly',
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: Sizes.medium),
              Consumer(
                builder: (context, ref, child) {
                  return SettingsItem(
                    vector: Vectors.logout,
                    label: 'Cerrar sesión',
                    onPressed: () {
                      ref.read(authControllerProvider.notifier).signOut();
                      ref.read(userControllerProvider.notifier).signOut();
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
