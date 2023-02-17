import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:predictions/predictions.dart';
import 'package:validators/validators.dart';

part 'symptom_search_cubit.freezed.dart';
part 'symptom_search_state.dart';

// TODO: Convert to BLoC and use debouncer
class SymptomSearchCubit extends Cubit<SymptomSearchState> {
  SymptomSearchCubit({
    required PredictionsRepository repository,
  })  : _repository = repository,
        super(const SymptomSearchState());

  final PredictionsRepository _repository;

  void queryChanged(String value) {
    if (value.isEmpty) {
      clear();
      return;
    }
    final query = Name.dirty(value.toUpperCase());
    emit(
      state.copyWith(
        query: query,
        status: Formz.validate([query]),
      ),
    );

    search();
  }

  Future<void> clear() async {
    emit(const SymptomSearchState());
  }

  Future<void> search() async {
    if (state.query.invalid) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }

    final possibleFailureOrResults =
        await _repository.search(state.query.value);
    possibleFailureOrResults.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          failure: failure,
        ),
      ),
      (results) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            results: results,
          ),
        );
      },
    );
  }
}
