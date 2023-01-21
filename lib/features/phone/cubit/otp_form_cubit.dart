import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'otp_form_cubit.freezed.dart';
part 'otp_form_state.dart';

class OtpFormCubit extends Cubit<OtpFormState> {
  OtpFormCubit() : super(const OtpFormState());

  void otpChanged(String value) {
    final otp = Otp.dirty(value);
    emit(
      state.copyWith(
        otp: otp,
        status: Formz.validate([otp]),
      ),
    );
  }
}
