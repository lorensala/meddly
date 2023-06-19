import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/export/export.dart';
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
          return const Center(child: Text('No user'));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    UserCircleAvatar(user: user, radius: Sizes.large),
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
                            color:
                                context.colorScheme.onSurface.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.extraLarge),
                Text(
                  'CUENTA',
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: Sizes.medium),
                const SettingsItem(
                  vector: Vectors.userEdit,
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
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.onSurface.withOpacity(0.5),
                  ),
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
                // const SizedBox(height: Sizes.medium),
                // SettingsItem(
                //   vector: Vectors.sun,
                //   label: 'Cambiar tema',
                //   onPressed: () {
                //     // GoRouter.of(context).push(
                //     //   '${UserPage.routeName}/${NotificationsPreferencesPage.routeName}',
                //     // );
                //   },
                // ),
                const SizedBox(height: Sizes.medium),
                const ExportItem(),
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
                      onPressed: () async {
                        await Future.wait([
                          ref.read(userControllerProvider.notifier).signOut(),
                          ref.read(authControllerProvider.notifier).signOut(),
                        ]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
