/// {@template appointment_speciality}
/// An enum that represents the speciality of an appointment.
/// {@endtemplate}
enum AppointmentSpeciality {
  /// {@macro appointment_speciality}
  urology,

  /// {@macro appointment_speciality}
  gynecology,

  /// {@macro appointment_speciality}
  cardiology,

  /// {@macro appointment_speciality}
  dermatology,

  /// {@macro appointment_speciality}
  neurology,

  /// {@macro appointment_speciality}
  orthopedics,

  /// {@macro appointment_speciality}
  pediatrics,

  /// {@macro appointment_speciality}
  pulmonology,

  /// {@macro appointment_speciality}
  radiology,

  /// {@macro appointment_speciality}
  surgery,

  /// {@macro appointment_speciality}
  other;

  /// Converts a [String] to an [AppointmentSpeciality].
  static AppointmentSpeciality fromString(String speciality) {
    return values.firstWhere(
      (element) => element.name == speciality,
      orElse: () => AppointmentSpeciality.other,
    );
  }
}
