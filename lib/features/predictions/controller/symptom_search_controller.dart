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
    );

    search();
  }

  Future<void> clear() async {
    state = const SymptomSearchState();
  }

  Future<void> search() async {
    if (state.query.value.isEmpty) {
      state = state.copyWith(
        results: [],
      );
      return;
    }

    if (state.query.isNotValid) {
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
      );
      return;
    }

    //? TODO(lorenzo): inside another predictions controller...??
    final (err, results) =
        await ref.read(predictionsRepositoryProvider).search(state.query.value);

    await ref.debounce(const Duration(milliseconds: 250));
    if (err != null) {
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
      );
    } else {
      state = state.copyWith(
        status: FormzSubmissionStatus.success,
        results: results,
      );
    }
  }
}
