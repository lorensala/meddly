import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/view/browse_page.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/router.dart';

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

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        boxShadow: selectedIndex.value == 0
            ? [
                BoxShadow(
                  color: context.colorScheme.onBackground.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ]
            : null,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            filterQuality: FilterQuality.medium,
            scale: 0.5,
            child: Transform.scale(
              scale: 2,
              child: SvgPicture.asset(
                icon,
                height: Sizes.extraLarge - Sizes.extraSmall,
                width: Sizes.extraLarge - Sizes.extraSmall,
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
    );
  }
}
