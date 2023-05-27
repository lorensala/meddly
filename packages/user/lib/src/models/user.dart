import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user/src/models/models.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
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

  static const empty = User(
    uid: '',
    email: '',
  );

  bool get hasBasicInformation =>
      firstName.isNotEmpty && lastName.isNotEmpty && birth.isNotEmpty;

  bool get hasPhoneNumber => phone.isNotEmpty;
}
