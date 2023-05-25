// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/view/browse_page.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/router/router.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({
    required this.child,
    super.key,
  });

  static const String routeName = '/';

  final Widget child;

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);

    selectedIndex.addListener(() {
      switch (selectedIndex.value) {
        case 0:
          ref.read(goRouterProvider).push(HomePage.routeName);
          break;
        case 1:
          ref.read(goRouterProvider).push(BrowsePage.routeName);
          break;
        case 2:
          //ref.read(goRouterProvider).go(SettingsShell.routeName);
          break;
      }
    });

    return SizedBox(
      child: BottomNavigation(
        itemCornerRadius: Sizes.small,
        selectedIndex: selectedIndex.value,
        containerHeight: 65,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        items: [
          BottomNavigationItem(
            vector: Vectors.home,
            activeColor: context.colorScheme.primary.withOpacity(0.25),
            inactiveColor: context.colorScheme.onSecondary.withOpacity(0.50),
            textAlign: TextAlign.center,
            label: 'Home',
          ),
          BottomNavigationItem(
            vector: Vectors.browse,
            activeColor: context.colorScheme.primary.withOpacity(0.25),
            inactiveColor: context.colorScheme.onSecondary.withOpacity(0.50),
            textAlign: TextAlign.center,
            label: 'Browse',
          ),
          BottomNavigationItem(
            vector: Vectors.settings,
            activeColor: context.colorScheme.primary.withOpacity(0.25),
            inactiveColor: context.colorScheme.onSecondary.withOpacity(0.50),
            textAlign: TextAlign.center,
            label: 'Settings',
          )
        ],
        onItemSelected: (int value) {
          selectedIndex.value = value;
        },
      ),
    );
  }
}
