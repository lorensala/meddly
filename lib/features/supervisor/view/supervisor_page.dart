import 'package:flutter/material.dart';

class SupervisorPage extends StatelessWidget {
  const SupervisorPage({super.key});

  static const routeName = 'supervisor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supervisor'),
      ),
      body: const Center(
        child: Text('Supervisor'),
      ),
    );
  }
}
