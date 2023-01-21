import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_bloc.freezed.dart';
part 'phone_event.dart';
part 'phone_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  PhoneBloc(this._repository) : super(const _Initial()) {
    on<_VerifyPhoneNumber>(_onVerifyPhone);
    on<_VerificationCompleted>(_onVerificationCompleted);
    on<_VerificationFailed>(_onVerificationFailed);
    on<_CodeSent>(_onCodeSent);
    on<_CodeAutoRetrievalTimeout>(_onCodeAutoRetrievalTimeout);
    on<_SendPhoneNumber>(_onSendPhoneNumber);
  }

  final AuthRepository _repository;

  FutureOr<void> _onSendPhoneNumber(
    _SendPhoneNumber event,
    Emitter<PhoneState> emit,
  ) async {
    await _repository.verifyPhone(
      phoneNumber: event.phoneNumber,
      verificationCompleted: (phoneAuthCredential) {
        add(
          _VerificationCompleted(
            phoneAuthCredential: phoneAuthCredential,
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

    add(_VerificationCompleted(phoneAuthCredential: phoneAuthCredential));
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
    final possibleFailureOrUnit =
        await _repository.signInWithPhoneAuthCredential(
      event.phoneAuthCredential,
    );

    possibleFailureOrUnit.fold(
      (failure) => emit(
        _Error(
          failure: failure,
          verificationId: event.phoneAuthCredential.verificationId ?? '',
        ),
      ),
      (_) => emit(const _Verificated()),
    );
  }
}
