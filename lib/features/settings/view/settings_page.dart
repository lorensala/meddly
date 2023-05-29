import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/settings/widgets/widgets.dart';
import 'package:meddly/features/user/user.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static String get routeName => '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
            const SizedBox(height: Sizes.medium),
            const SettingsItem(
              vector: Vectors.bellRinging,
              label: 'Preferencia de notificaciones',
            ),
            const SizedBox(height: Sizes.medium),
            SettingsItem(
              vector: Vectors.logout,
              label: 'Cerrar sesión',
              onPressed: () {
                ref.read(authControllerProvider.notifier).signOut();
                ref.read(userControllerProvider.notifier).signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
