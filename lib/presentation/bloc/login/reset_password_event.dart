import "package:dart_mappable/dart_mappable.dart";

part "reset_password_event.mapper.dart";

@MappableClass(discriminatorKey: "event")
sealed class ResetPasswordEvent with ResetPasswordEventMappable {
  const ResetPasswordEvent();
}

@MappableClass(discriminatorValue: "resetPassword")
class ResetPasswordEventResetPassword extends ResetPasswordEvent with ResetPasswordEventResetPasswordMappable {
  final String email;

  const ResetPasswordEventResetPassword({required this.email});
}
