import 'package:flutter/material.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/user/user.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userProvider, (_, user) {
      // user.fold(() => null, (a) => null)
      // state.whenOrNull(
      //   data: (user) {

      //   },
      // );
    });

    return const HomeBody();
  }
}
