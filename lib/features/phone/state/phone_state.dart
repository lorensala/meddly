import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_state.freezed.dart';

@freezed
class PhoneState with _$PhoneState {
  const factory PhoneState.initial() = _Initial;
  const factory PhoneState.sendingOtp() = _SendingOtp;
  const factory PhoneState.otpSent() = _OtpSent;
  const factory PhoneState.verifyingOtp() = _VerifyingOtp;
  const factory PhoneState.otpVerified() = _OtpVerified;
  const factory PhoneState.error(String message) = _Error;

  const PhoneState._();

  bool get isInitial => this is _Initial;
  bool get isSendingOtp => this is _SendingOtp;
  bool get isOtpSent => this is _OtpSent;
  bool get isVerifyingOtp => this is _VerifyingOtp;
  bool get isOtpVerified => this is _OtpVerified;
  bool get isError => this is _Error;
}
