import 'package:meddly/features/predictions/state/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'disease_search_controller.g.dart';

@riverpod
class DiseaseSearchController extends _$DiseaseSearchController {
  @override
  DiseaseSearchState build() {
    return const DiseaseSearchState();
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
  }

  Future<void> clear() async {
    state = const DiseaseSearchState();
  }
}
