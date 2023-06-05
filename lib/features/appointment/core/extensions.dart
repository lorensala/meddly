import 'package:appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';

extension AppointmentExceptionX on AppointmentException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      AppointmentUnknownException() => l10n.unknownError,
      AppointmentNotFoundException() => l10n.unknownError,
      AppointmentSerializationException() => l10n.unknownError,
      AppointmentConnectionException() => l10n.unknownError,
      AppointmentNotYoursException() => l10n.unknownError,
    };
  }
}

extension AppointmentSpecialityX on AppointmentSpeciality {
  String localized(AppLocalizations l10n) {
    return switch (this) {
      AppointmentSpeciality.cardiology => l10n.cardiology,
      AppointmentSpeciality.dermatology => l10n.dermatology,
      AppointmentSpeciality.endocrinology => l10n.endocrinology,
      AppointmentSpeciality.gastroenterology => l10n.gastroenterology,
      AppointmentSpeciality.gynecology => l10n.gynecology,
      AppointmentSpeciality.hematology => l10n.hematology,
      AppointmentSpeciality.neurology => l10n.neurology,
      AppointmentSpeciality.oncology => l10n.oncology,
      AppointmentSpeciality.ophthalmology => l10n.ophthalmology,
      AppointmentSpeciality.orthopedics => l10n.orthopedics,
      AppointmentSpeciality.pediatrics => l10n.pediatrics,
      AppointmentSpeciality.psychiatry => l10n.psychiatry,
      AppointmentSpeciality.radiology => l10n.radiology,
      AppointmentSpeciality.rheumatology => l10n.rheumatology,
      AppointmentSpeciality.urology => l10n.urology,
      AppointmentSpeciality.pulmonology => l10n.pulmonology,
      AppointmentSpeciality.nephrology => l10n.nephrology,
      AppointmentSpeciality.otolaryngology => l10n.otolaryngology,
      AppointmentSpeciality.surgery => l10n.surgery,
      AppointmentSpeciality.other => l10n.other,
    };
  }
}
