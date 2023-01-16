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
  Stream<Option<User>> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return none();
      }

      return some(firebaseUser);
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
    try {
      final userCredentails =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //check if user is new
      return right(userCredentails.additionalUserInfo!.isNewUser);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromCode(e.code));
    } catch (_) {
      return left(const AuthFailure.unknownError());
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [AuthFailure] if an exception occurs.\
  /// Returns [bool] if the user is New.
  Future<Either<AuthFailure, bool>> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return right(false);
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      //check if user is new and return
      return right(userCredential.additionalUserInfo!.isNewUser);
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
}
