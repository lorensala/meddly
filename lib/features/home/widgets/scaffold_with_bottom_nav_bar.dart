// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/view/browse_page.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/settings/view/settings_page.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
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
          ref.read(goRouterProvider).go(HomePage.routeName);
        case 1:
          ref.read(goRouterProvider).go(BrowsePage.routeName);
        case 2:
          ref.read(goRouterProvider).go(SettingsPage.routeName);
        case 3:
          ref.read(goRouterProvider).go(UserPage.routeName);
      }
    });

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex.value,
        backgroundColor: context.colorScheme.background,
        unselectedFontSize: 13,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          selectedIndex.value = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Vectors.home,
              colorFilter: ColorFilter.mode(
                selectedIndex.value == 0
                    ? context.colorScheme.primary
                    : context.colorScheme.onSecondary.withOpacity(0.8),
                BlendMode.srcIn,
              ),
            ),
            label: context.l10n.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Vectors.browse,
              colorFilter: ColorFilter.mode(
                selectedIndex.value == 1
                    ? context.colorScheme.primary
                    : context.colorScheme.onSecondary.withOpacity(0.8),
                BlendMode.srcIn,
              ),
            ),
            label: context.l10n.browse,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Vectors.settings,
              colorFilter: ColorFilter.mode(
                selectedIndex.value == 2
                    ? context.colorScheme.primary
                    : context.colorScheme.onSecondary.withOpacity(0.8),
                BlendMode.srcIn,
              ),
            ),
            label: context.l10n.settings,
          ),
          BottomNavigationBarItem(
            icon: const UserAvatar(),
            label: context.l10n.profile,
          ),
        ],
      ),
    );
  }
}
