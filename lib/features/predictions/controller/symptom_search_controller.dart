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

    // search(value);
  }

  Future<void> clear() async {
    state = const SymptomSearchState();
  }
}
