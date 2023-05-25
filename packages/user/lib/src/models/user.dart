import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user/src/models/models.dart';

part 'user.freezed.dart';

/// {@template user}
/// Model for meddly user
/// {@endtemplate}
@freezed
class User with _$User {
  /// {@macro user}
  const factory User({
    required String uid,
    required String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String phone,
    @Default(Sex.male()) Sex sex,
    @Default('') String birth,
    double? height,
    double? weight,
    @Default('') String invitation,
  }) = _User;

  const User._();

  /// {@macro user}
  /// Empty user
  static const empty = User(
    uid: '',
    email: '',
  );

  bool get hasBasicInformation =>
      firstName.isNotEmpty && lastName.isNotEmpty && birth.isNotEmpty;

  bool get hasPhoneNumber => phone.isNotEmpty;
}
