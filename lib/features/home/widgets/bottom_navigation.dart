import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    required this.items,
    required this.onItemSelected,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 200),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.curve = Curves.linear,
    super.key,
  }) : assert(
          items.length >= 2 && items.length <= 5,
          'items must have 2-5 items',
        );

  final int selectedIndex;

  final double iconSize;

  final Color? backgroundColor;

  final bool showElevation;

  final Duration animationDuration;

  final List<BottomNavigationItem> items;

  final ValueChanged<int> onItemSelected;

  final MainAxisAlignment mainAxisAlignment;

  final double itemCornerRadius;

  final double containerHeight;

  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? context.colorScheme.secondary;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.medium,
            horizontal: Sizes.small,
          ),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              final index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  });
  final double iconSize;
  final bool isSelected;
  final BottomNavigationItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? 60 + context.width / 5 : 60,
        height: 48,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color:
              isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                item.vector,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? context.colorScheme.primary
                      : context.colorScheme.onSecondary.withOpacity(0.50),
                  BlendMode.srcIn,
                ),
              ),
              if (isSelected)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Center(
                      child: Text(
                        item.label,
                        style: context.textTheme.titleSmall!.copyWith(
                          color: context.colorScheme.primary,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigationItem {
  BottomNavigationItem({
    required this.vector,
    required this.label,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  final String vector;

  final String label;

  final Color activeColor;

  final Color? inactiveColor;

  final TextAlign? textAlign;
}
