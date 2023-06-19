import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class FilterModal<T> extends HookWidget {
  const FilterModal({
    required this.items,
    required this.selectedItems,
    required this.labelBuilder,
    required this.onSelected,
    required this.onDeselected,
    required this.onAllSelected,
    required this.onCleanSelection,
    super.key,
  });

  final List<T> items;
  final List<T> selectedItems;
  final void Function(T item) onSelected;
  final void Function(T item) onDeselected;
  final void Function() onAllSelected;
  final void Function() onCleanSelection;
  final String Function(T item) labelBuilder;

  @override
  Widget build(BuildContext context) {
    final searchedItems = useState(items);
    final controller = useTextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetDecoration(),
            const SizedBox(height: Sizes.medium),
            // search
            TextFormField(
              style: context.textTheme.bodyMedium,
              controller: controller,
              onChanged: (value) {
                searchedItems.value = items
                    .where(
                      (item) =>
                          labelBuilder(item).toLowerCase().contains(value),
                    )
                    .toList();
              },
              decoration: InputDecoration(
                hintText: context.l10n.search,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          controller.clear();
                          searchedItems.value = items;
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
              ),
            ),
            const SizedBox(height: Sizes.medium),
            Expanded(
              child: _FilterList<T>(
                items: searchedItems.value,
                selectedItems: selectedItems,
                labelBuilder: labelBuilder,
                onDeselected: onDeselected,
                onSelected: onSelected,
                onAllSelected: onAllSelected,
              ),
            ),
            const SizedBox(height: Sizes.medium),
            Button(
              onPressed: () {
                Navigator.of(context).pop();
              },
              label: context.l10n.accept,
            ),
            Center(
              child: TextButton(
                onPressed: onCleanSelection,
                child: Text(
                  context.l10n.cleanSelection,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                        decorationThickness: 2,
                      )
                      .underlined(distance: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterList<T> extends HookWidget {
  const _FilterList({
    required this.items,
    required this.selectedItems,
    required this.labelBuilder,
    required this.onSelected,
    required this.onDeselected,
    required this.onAllSelected,
    super.key,
  });

  final List<T> items;
  final List<T> selectedItems;
  final String Function(T item) labelBuilder;
  final void Function(T item) onSelected;
  final void Function(T item) onDeselected;
  final VoidCallback onAllSelected;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const EmptyContainer(message: 'No items found');
    }

    return Theme(
      data: Theme.of(context).copyWith(
        listTileTheme: const ListTileThemeData(
          tileColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.small,
          minLeadingWidth: 0,
          titleAlignment: ListTileTitleAlignment.center,
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _FilterListItem<T>(
              labelBuilder: (_) => context.l10n.all,
              item: items.first,
              onSelected: (_) => onAllSelected(),
              onDeselected: (_) {},
              isSelected: selectedItems.length == items.length,
            );
          }

          if (index == 1) {
            return const Divider();
          }

          final item = items[index - 2];
          return _FilterListItem<T>(
            labelBuilder: labelBuilder,
            item: item,
            onSelected: onSelected,
            onDeselected: onDeselected,
            isSelected: selectedItems.contains(item),
          );
        },
      ),
    );
  }
}

class _FilterListItem<T> extends StatelessWidget {
  const _FilterListItem({
    required this.item,
    required this.labelBuilder,
    required this.onSelected,
    required this.onDeselected,
    required this.isSelected,
    super.key,
  });

  final T? item;
  final String Function(T item) labelBuilder;
  final void Function(T item) onSelected;
  final void Function(T item) onDeselected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (item == null) return const SizedBox.shrink();

    return ListTile(
      visualDensity: const VisualDensity(vertical: -Sizes.extraSmall),
      title: Text(labelBuilder(item as T), style: context.textTheme.bodyMedium),
      onTap: () {
        if (isSelected) {
          onDeselected(item as T);
        } else {
          onSelected(item as T);
        }
      },
      leading: SizedBox(
        width: Sizes.large,
        child: Checkbox(
          value: isSelected,
          onChanged: (value) {
            if (value! == true) {
              onSelected(item as T);
            } else {
              onDeselected(item as T);
            }
          },
        ),
      ),
    );
  }
}
