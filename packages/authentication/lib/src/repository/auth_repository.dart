import 'dart:async';

import 'package:authentication/src/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// {@template auth_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthRepository {
  /// {@macro auth_repository}
  AuthRepository({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  /// Stream of [Option] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [None] if the user is not authenticated.
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }

      return firebaseUser;
    });
  }

  /// Get the current user.
  User? get currentUser => _firebaseAuth.currentUser;

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [AuthFailure] if an exception occurs.\
  /// Returns [bool] if the user is New.
  Future<Either<AuthFailure, bool>> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredentails = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    //check if user is new
    return right(userCredentails.additionalUserInfo!.isNewUser);
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [AuthFailure] if an exception occurs.\
  Future<Either<AuthFailure, bool>> logInWithGoogle() async {
    try {
      // TODO(me): no debería deolver right si no se logra el login
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return right(false);
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);

      return right(true);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromCode(e.code));
    } catch (_) {
      return left(const AuthFailure.unknownError());
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [AuthFailure] if an exception occurs.
  Future<Either<AuthFailure, Unit>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromCode(e.code));
    } catch (_) {
      return left(const AuthFailure.unknownError());
    }
  }

  /// Signs out the current user which will emit
  ///
  /// Throws a [AuthFailure] if an exception occurs.
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
      return right(unit);
    } catch (_) {
      return left(const AuthFailure.unknownError());
    }
  }

  /// Deletes the current user.
  ///
  /// Throws a [AuthFailure] if an exception occurs.\
  /// Returns [Unit] if the user is deleted.
  Future<Either<AuthFailure, Unit>> deleteUser() async {
    try {
      await _firebaseAuth.currentUser!.delete();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromCode(e.code));
    } catch (_) {
      return left(const AuthFailure.unknownError());
    }
  }

  /// Sends a password reset email to the provided [email].
  ///
  /// Throws a [AuthFailure] if an exception occurs.\
  /// Returns [Unit] if the email is sent.
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromCode(e.code));
    } catch (_) {
      return left(const AuthFailure.unknownError());
    }
  }

  /// Verifies the phone number with the provided [phoneNumber].
  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
    int? forceResendingToken,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      forceResendingToken: forceResendingToken,
    );
  }

  /// Signs in with the provided [phoneAuthCredential].
  ///
  /// Throws a [AuthFailure] if an exception occurs.\
  /// Returns [Unit] if the auth is successful.
  Future<Either<AuthFailure, Unit>> signInWithPhoneAuthCredential(
    PhoneAuthCredential phoneAuthCredential,
  ) async {
    try {
      await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      return right(unit);
      //check if user is new and return
      //return right(userCredential.additionalUserInfo!.isNewUser);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromCode(e.code));
    } catch (_) {
      return left(const AuthFailure.unknownError());
    }
  }

  /// Updates the current user's phone number.
  ///
  /// Throws a [AuthFailure] if an exception occurs.\
  /// Returns [Unit] if the phone number is updated.
  Future<Either<AuthFailure, Unit>> updatePhoneNumber(
    PhoneAuthCredential credential,
  ) async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return left(const AuthFailure.userNotFound());
      }
      await _firebaseAuth.currentUser!.updatePhoneNumber(
        credential,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromCode(e.code));
    } catch (_) {
      return left(const AuthFailure.unknownError());
    }
  }
}
