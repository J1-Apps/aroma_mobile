import "package:dart_mappable/dart_mappable.dart";

part "register_event.mapper.dart";

@MappableClass(discriminatorKey: "event")
sealed class RegisterEvent with RegisterEventMappable {
  const RegisterEvent();
}

@MappableClass(discriminatorValue: "signUpWithEmail")
class RegisterEventSignUpWithEmail extends RegisterEvent with RegisterEventSignUpWithEmailMappable {
  final String email;
  final String password;

  const RegisterEventSignUpWithEmail({required this.email, required this.password});
}
