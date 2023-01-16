import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user/user.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required UserRepository userRepository,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const _Loading()) {
    on<_Watch>(_onWatch);
    on<_UserReceived>(_onUserReceived);
    on<_CreateUser>(_onCreateUser);
    on<_Logout>(_onLogout);

    add(const _Watch());
  }

  final UserRepository _userRepository;
  final AuthRepository _authRepository;
  StreamSubscription<Option<User>>? _userSubscription;

  FutureOr<void> _onCreateUser(
    _CreateUser event,
    Emitter<UserState> emit,
  ) async {
    emit(const _Loading());
    final result = await _userRepository.createUser(event.user);

    if (result.isLeft()) {
      final failure = (result as Left<UserFailure, Unit>).value;
      emit(_Failure(failure));
    }
  }

  FutureOr<void> _onWatch(_Watch event, Emitter<UserState> emit) {
    emit(const _Loading());
    _userSubscription?.cancel();
    _userSubscription = _userRepository.user.listen((event) {
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

  FutureOr<void> _onLogout(_Logout event, Emitter<UserState> emit) async {
    emit(const _Loading());
    _userRepository.clearCache();
    await _authRepository.signOut();
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
