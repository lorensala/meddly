import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/cubit/cubit.dart';
import 'package:predictions/predictions.dart';

class SymptomSearchForm extends StatelessWidget {
  const SymptomSearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SymptomSearchCubit(repository: GetIt.I.get<PredictionsRepository>()),
      child: Column(
        children: const [
          Center(child: _SearchField()),
          Expanded(child: _Results()),
        ],
      ),
    );
  }
}

class _Results extends StatelessWidget {
  const _Results();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SymptomSearchCubit, SymptomSearchState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.results.length,
          itemBuilder: (context, index) {
            final result = state.results[index];
            return ListTile(
              title: Text(result),
            );
          },
        );
      },
    );
  }
}

class _SearchField extends StatefulWidget {
  const _SearchField();

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SymptomSearchCubit>();
    return BlocBuilder<SymptomSearchCubit, SymptomSearchState>(
      builder: (context, state) {
        return TextFormField(
          controller: _controller,
          onChanged: cubit.queryChanged,
          decoration: InputDecoration(
            fillColor: context.colorScheme.secondary,
            hintText: 'Search',
            suffixIcon: _controller.value.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      cubit.clear();
                      _controller.clear();
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
      },
    );
  }
}
