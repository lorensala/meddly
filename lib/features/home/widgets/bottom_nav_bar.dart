import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/provider.dart';

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({
    required this.onBranchTapped,
    super.key,
  });

  final void Function(int) onBranchTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);

    selectedIndex.addListener(() {
      onBranchTapped(selectedIndex.value);
    });

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onBackground.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: kBottomNavigationBarHeight + Sizes.small,
          child: Row(
            children: [
              Expanded(
                child: _BottomNavBarItem(
                  icon: Vectors.home,
                  label: context.l10n.home,
                  isSelected: selectedIndex.value == 0,
                  onTap: () {
                    if (selectedIndex.value == 0) {
                      ref.read(goRouterProvider).go(HomePage.routeName);
                    } else {
                      selectedIndex.value = 0;
                    }
                  },
                ),
              ),
              Expanded(
                child: _BottomNavBarItem(
                  icon: Vectors.plusCircle,
                  label: context.l10n.add,
                  isSelected: false,
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      useRootNavigator: true,
                      isScrollControlled: true,
                      backgroundColor: context.colorScheme.background,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(Sizes.large),
                        ),
                      ),
                      builder: (_) {
                        return ProviderScope(
                          parent: ProviderScope.containerOf(context),
                          child: const AddBottomSheet(),
                        );
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: _BottomNavBarItem(
                  icon: Vectors.browse,
                  label: context.l10n.browse,
                  isSelected: selectedIndex.value == 1,
                  onTap: () {
                    if (selectedIndex.value == 1) {
                      ref.read(goRouterProvider).go(BrowsePage.routeName);
                    } else {
                      selectedIndex.value = 1;
                    }
                  },
                ),
              ),
              Expanded(
                child: _BottomNavBarItem(
                  icon: Vectors.user,
                  label: context.l10n.profile,
                  isSelected: selectedIndex.value == 2,
                  onTap: () {
                    if (selectedIndex.value == 2) {
                      ref.read(goRouterProvider).go(UserPage.routeName);
                    } else {
                      selectedIndex.value = 2;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: isSelected
                  ? ColorFilter.mode(
                      context.colorScheme.primary,
                      BlendMode.srcIn,
                    )
                  : ColorFilter.mode(
                      context.colorScheme.onBackground.withOpacity(0.5),
                      BlendMode.srcIn,
                    ),
            ),
            Text(
              label,
              style: context.textTheme.bodySmall!.copyWith(
                color: isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
