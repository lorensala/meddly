import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/settings/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static String get routeName => '/settings';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Sizes.medium),
            SettingsItem(vector: Vectors.user, label: 'Modificar mis datos'),
            SizedBox(height: Sizes.medium),
            SettingsItem(
              vector: Vectors.changePassword,
              label: 'Cambiar contraseña',
            ),
            SizedBox(height: Sizes.medium),
            SettingsItem(
              vector: Vectors.bellRinging,
              label: 'Preferencia de notificaciones',
            ),
            SizedBox(height: Sizes.medium),
            SettingsItem(vector: Vectors.logout, label: 'Cerrar sesión'),
          ],
        ),
      ),
    );
  }
}
