import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user/user.dart' as user;

part 'phone_bloc.freezed.dart';
part 'phone_event.dart';
part 'phone_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  PhoneBloc({
    required AuthRepository authRepository,
    required user.UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const _Initial()) {
    on<_VerifyPhoneNumber>(_onVerifyPhone, transformer: restartable());
    on<_VerificationCompleted>(_onVerificationCompleted);
    on<_VerificationFailed>(_onVerificationFailed);
    on<_CodeSent>(_onCodeSent);
    on<_CodeAutoRetrievalTimeout>(_onCodeAutoRetrievalTimeout);
    on<_SendPhoneNumber>(_onSendPhoneNumber);
  }

  final AuthRepository _authRepository;
  final user.UserRepository _userRepository;

  FutureOr<void> _onSendPhoneNumber(
    _SendPhoneNumber event,
    Emitter<PhoneState> emit,
  ) async {
    await _authRepository.verifyPhone(
      phoneNumber: event.phoneNumber,
      verificationCompleted: (phoneAuthCredential) {
        add(
          _VerificationCompleted(
            phoneAuthCredential: phoneAuthCredential,
            phoneNumber: event.phoneNumber,
          ),
        );
      },
      verificationFailed: (firebaseAuthException) {
        add(
          _VerificationFailed(
            firebaseAuthException: firebaseAuthException,
          ),
        );
      },
      codeSent: (verificationId, forceResendingToken) {
        add(
          _CodeSent(
            verificationId: verificationId,
            forceResendingToken: forceResendingToken,
          ),
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {
        add(_CodeAutoRetrievalTimeout(verificationId: verificationId));
      },
      forceResendingToken: event.forceResendingToken,
    );
  }

  FutureOr<void> _onVerifyPhone(
    _VerifyPhoneNumber event,
    Emitter<PhoneState> emit,
  ) async {
    emit(const _Loading());

    final phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: event.verificationId,
      smsCode: event.smsCode,
    );

    add(
      _VerificationCompleted(
        phoneAuthCredential: phoneAuthCredential,
        phoneNumber: event.phoneNumber,
      ),
    );
  }

  FutureOr<void> _onCodeAutoRetrievalTimeout(
    _CodeAutoRetrievalTimeout event,
    Emitter<PhoneState> emit,
  ) {}

  FutureOr<void> _onVerificationFailed(
    _VerificationFailed event,
    Emitter<PhoneState> emit,
  ) async {
    state.whenOrNull(
      codeSentSuccess: (verificationId, forceResendingToken) {
        emit(
          _CodeSentSuccess(
            verificationId: verificationId,
            forceResendingToken: forceResendingToken,
          ),
        );
      },
    );
  }

  FutureOr<void> _onCodeSent(
    _CodeSent event,
    Emitter<PhoneState> emit,
  ) async {
    emit(
      _CodeSentSuccess(
        verificationId: event.verificationId,
        forceResendingToken: event.forceResendingToken,
      ),
    );
  }

  FutureOr<void> _onVerificationCompleted(
    _VerificationCompleted event,
    Emitter<PhoneState> emit,
  ) async {
    final credential = event.phoneAuthCredential;
    final possibleFailureOrUnit =
        await _authRepository.updatePhoneNumber(credential);

    await possibleFailureOrUnit.fold(
      (failure) {
        emit(
          _Error(
            failure: failure,
            verificationId: event.phoneAuthCredential.verificationId ?? '',
          ),
        );
      },
      (_) async {
        await _userRepository.getUser().fold(
          (failure) {
            emit(
              _Error(
                failure: const AuthFailure.unknownError(),
                verificationId: event.phoneAuthCredential.verificationId ?? '',
              ),
            );
          },
          (user) async {
            if (user == null) {
              emit(
                _Error(
                  failure: const AuthFailure.unknownError(),
                  verificationId:
                      event.phoneAuthCredential.verificationId ?? '',
                ),
              );
              return;
            }
            final userWithPhoneNumber = user.copyWith(
              phone: event.phoneNumber,
            );

            final possibleFailureOrUserUpdated =
                await _userRepository.updateUser(
              userWithPhoneNumber,
            );

            possibleFailureOrUserUpdated.fold(
              (failure) {
                emit(
                  _Error(
                    failure: const AuthFailure.unknownError(),
                    verificationId:
                        event.phoneAuthCredential.verificationId ?? '',
                  ),
                );
              },
              (_) {
                emit(const _Verificated());
              },
            );
          },
        );
      },
    );
  }
}
