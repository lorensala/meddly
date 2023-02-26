// import 'dart:async';

// import 'package:authentication/authentication.dart';
// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'auth_bloc.freezed.dart';
// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc({required AuthRepository authRepository})
//       : _authRepository = authRepository,
//         super(
//           authRepository.currentUser == null
//               ? const AuthState.unauthenticated()
//               : AuthState.authenticated(authRepository.currentUser!),
//         ) {
//     on<FirebaseUserChanged>(_onUserChanged);

//     on<LogoutRequestedEvent>(_onLogoutRequested);

//     _userSubscription = _authRepository.user
//         .listen((Option<User> user) => add(FirebaseUserChanged(user)));
//   }
//   final AuthRepository _authRepository;
//   late final StreamSubscription<Option<User>> _userSubscription;

//   void _onUserChanged(FirebaseUserChanged event, Emitter<AuthState> emit) {
//     event.user.fold(
//       () => emit(const AuthState.unauthenticated()),
//       (user) => emit(AuthState.authenticated(user)),
//     );
//   }

//   void _onLogoutRequested(LogoutRequestedEvent event, Emitter<AuthState> emit) {
//     unawaited(_authRepository.signOut());
//   }

//   @override
//   Future<void> close() {
//     _userSubscription.cancel();
//     return super.close();
//   }
// }
