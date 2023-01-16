import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user/user.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._repository) : super(const _Loading()) {
    on<_Watch>(_onWatch);
    on<_UserReceived>(_onUserReceived);
    on<_CreateUser>(_onCreateUser);

    add(const _Watch());
  }

  FutureOr<void> _onCreateUser(
    _CreateUser event,
    Emitter<UserState> emit,
  ) async {
    emit(const _Loading());
    final result = await _repository.createUser(event.user);

    if (result.isLeft()) {
      final failure = (result as Left<UserFailure, Unit>).value;
      emit(_Failure(failure));
    }
  }

  final UserRepository _repository;
  StreamSubscription<Option<User>>? _userSubscription;

  FutureOr<void> _onWatch(_Watch event, Emitter<UserState> emit) {
    emit(const _Loading());
    _userSubscription?.cancel();
    _userSubscription = _repository.user.listen((event) {
      add(_UserReceived(event));
    });
  }

  FutureOr<void> _onUserReceived(
    _UserReceived event,
    Emitter<UserState> emit,
  ) {
    emit(
      event.nothingOrUser.fold(
        () => const _Failure(UserFailure.notFound()),
        _Loaded.new,
      ),
    );
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
