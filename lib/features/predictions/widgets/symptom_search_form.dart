import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/controller/symptom_search_controller.dart';
import 'package:meddly/features/predictions/provider/provider.dart';

class SymptomSearchForm extends StatelessWidget {
  const SymptomSearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(child: _SearchField()),
        SizedBox(height: Sizes.smallSpacing),
        Expanded(child: _Results()),
      ],
    );
  }
}

class _Results extends ConsumerWidget {
  const _Results();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(symptomSearchResultsProvider);

    return ListView.separated(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return ListTile(
          title: Text(result.description),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10);
      },
    );
  }
}

class _SearchField extends HookConsumerWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final notifier = ref.watch(symptomSearchControllerProvider.notifier);

    useListenable(controller);

    return TextFormField(
      controller: controller,
      onChanged: notifier.queryChanged,
      decoration: InputDecoration(
        fillColor: context.colorScheme.secondary,
        hintText: 'Search',
        suffixIcon: controller.value.text.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  notifier.clear();
                  controller.clear();
                  FocusScope.of(context).unfocus();
                },
              ),
        // errorText: !state.query.pure
        //     ? state.query.error?.when(
        //         invalid: () => context.l10n.invalidName,
        //         tooLong: () => context.l10n.nameTooLong,
        //         empty: () => context.l10n.nameEmpty,
        //       )
        //     : null,
      ),
    );
  }
}
