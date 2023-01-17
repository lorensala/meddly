part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.watch() = _Watch;
  const factory UserEvent.createUser(
    User user,
  ) = _CreateUser;
  const factory UserEvent.logout() = _Logout;
  const factory UserEvent.checkIfUserExists() = _CheckIfUserExists;
}
