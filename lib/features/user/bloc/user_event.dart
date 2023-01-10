part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.watch() = _Watch;
  const factory UserEvent.userReceived(
    Option<User> nothingOrUser,
  ) = _UserReceived;
}
