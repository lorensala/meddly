import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/view/browse_page.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/router/router.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key, required this.child});

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
    final _selectedIndex = useState(0);

    _selectedIndex.addListener(() {
      switch (_selectedIndex.value) {
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
      child: BottomNavyBar(
        itemCornerRadius: Sizes.small,
        selectedIndex: _selectedIndex.value,
        containerHeight: 65,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        items: [
          BottomNavyBarItem(
            icon: Row(
              children: [
                SvgPicture.asset(
                  Vectors.home,
                  colorFilter: ColorFilter.mode(
                      _selectedIndex.value == 0
                          ? context.colorScheme.primary
                          : context.colorScheme.onSecondary.withOpacity(0.50),
                      BlendMode.srcIn),
                ),
              ],
            ),
            activeColor: context.colorScheme.primary.withOpacity(0.25),
            inactiveColor: context.colorScheme.onSecondary.withOpacity(0.50),
            textAlign: TextAlign.center,
            title: Text(
              'Home',
              style: context.textTheme.titleSmall!
                  .copyWith(color: context.colorScheme.primary),
            ),
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(Vectors.browse,
                colorFilter: ColorFilter.mode(
                    _selectedIndex.value == 1
                        ? context.colorScheme.primary
                        : context.colorScheme.onSecondary.withOpacity(0.50),
                    BlendMode.srcIn)),
            activeColor: context.colorScheme.primary.withOpacity(0.25),
            inactiveColor: context.colorScheme.onSecondary.withOpacity(0.50),
            textAlign: TextAlign.center,
            title: Text(
              'Browse',
              style: context.textTheme.titleSmall!
                  .copyWith(color: context.colorScheme.primary),
            ),
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(Vectors.settings,
                colorFilter: ColorFilter.mode(
                    _selectedIndex.value == 2
                        ? context.colorScheme.primary
                        : context.colorScheme.onSecondary.withOpacity(0.50),
                    BlendMode.srcIn)),
            activeColor: context.colorScheme.primary.withOpacity(0.25),
            inactiveColor: context.colorScheme.onSecondary.withOpacity(0.50),
            textAlign: TextAlign.center,
            title: Text(
              'Settings',
              style: context.textTheme.titleSmall!
                  .copyWith(color: context.colorScheme.primary),
            ),
          ),
        ],
        onItemSelected: (int value) {
          _selectedIndex.value = value;
        },
      ),
    );
  }
}
