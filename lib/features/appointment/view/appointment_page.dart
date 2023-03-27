import 'package:flutter/material.dart';
import 'package:meddly/features/appointment/widgets/appointment_body.dart';

/// {@template appointment_page}
/// A description for AppointmentPage
/// {@endtemplate}
class AppointmentPage extends StatelessWidget {
  /// {@macro appointment_page}
  const AppointmentPage({super.key});

  /// The static route for AppointmentPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AppointmentPage());
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppointmentView(),
    );
  }  
}

/// {@template appointment_view}
/// Displays the Body of AppointmentView
/// {@endtemplate}
class AppointmentView extends StatelessWidget {
  /// {@macro appointment_view}
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppointmentBody();
  }
}
