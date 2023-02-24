// import 'dart:async';

// import 'package:authentication/authentication.dart';
// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:user/user.dart';

// part 'user_bloc.freezed.dart';
// part 'user_event.dart';
// part 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   UserBloc({
//     required UserRepository userRepository,
//     required AuthRepository authRepository,
//   })  : _authRepository = authRepository,
//         _userRepository = userRepository,
//         super(const _Loading()) {
//     on<_Watch>(_onWatch);
//     on<_CreateUser>(_onCreateUser);
//     on<_Logout>(_onLogout);
//     on<_CheckIfUserExists>(_onCheckIfUserExists);

//     add(const _Watch());
//   }

//   final UserRepository _userRepository;
//   final AuthRepository _authRepository;

//   FutureOr<void> _onCreateUser(
//     _CreateUser event,
//     Emitter<UserState> emit,
//   ) async {
//     emit(const _Loading());
//     final result = await _userRepository.createUser(event.user);

//     if (result.isLeft()) {
//       final failure = (result as Left<UserFailure, Unit>).value;
//       emit(_Failure(failure));
//     }
//   }

//   FutureOr<void> _onWatch(_Watch event, Emitter<UserState> emit) async {
//     await emit.forEach(
//       _userRepository.user,
//       onData: (nothingOrUser) => nothingOrUser.fold(
//         () => state,
//         _Loaded.new,
//       ),
//     );
//   }

//   FutureOr<void> _onLogout(_Logout event, Emitter<UserState> emit) async {
//     emit(const _Loading());
//     _userRepository.clearCache();
//     await _authRepository.signOut();
//   }

//   FutureOr<void> _onCheckIfUserExists(
//     _CheckIfUserExists event,
//     Emitter<UserState> emit,
//   ) async {
//     emit(const _Loading());
//     // check if user is in cache...
//     final possibleFailureOrUserOrNull = _userRepository.getUser();

//     if (possibleFailureOrUserOrNull.isLeft()) {
//       final failure =
//           (possibleFailureOrUserOrNull as Left<UserFailure, User>).value;
//       emit(_Failure(failure));
//     }

//     // check if user is in database...
//     final possibleFailureOrUserExists = await _userRepository.fetchUser();

//     if (possibleFailureOrUserExists.isLeft()) {
//       final failure =
//           (possibleFailureOrUserExists as Left<UserFailure, User>).value;
//       emit(_Failure(failure));
//     }
//   }

//   @override
//   Future<void> close() {
//     return super.close();
//   }
// }
