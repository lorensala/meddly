import 'package:formz/formz.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/provider/provider.dart';
import 'package:meddly/features/predictions/state/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'symptom_search_controller.g.dart';

@riverpod
class SymptomSearchController extends _$SymptomSearchController {
  @override
  SymptomSearchState build() {
    return const SymptomSearchState();
  }

  void queryChanged(String value) {
    if (value.isEmpty) {
      clear();
      return;
    }
    final query = Name.dirty(value.toUpperCase());
    state = state.copyWith(
      query: query,
      status: Formz.validate([query]),
    );

    search();
  }

  Future<void> clear() async {
    state = const SymptomSearchState();
  }

  Future<void> search() async {
    if (state.query.value.isEmpty) {
      state = state.copyWith(
        status: FormzStatus.submissionSuccess,
        results: [],
      );
      return;
    }

    if (state.query.invalid) {
      state = state.copyWith(status: FormzStatus.submissionFailure);
      return;
    }

    //? TODO(lorenzo): inside another predictions controller...??
    final res =
        await ref.read(predictionsRepositoryProvider).search(state.query.value);

    await ref.debounce(const Duration(milliseconds: 250));

    state = res.fold(
      (failure) => state.copyWith(
        status: FormzStatus.submissionFailure,
      ),
      (results) => state.copyWith(
        status: FormzStatus.submissionSuccess,
        results: results,
      ),
    );
  }
}
