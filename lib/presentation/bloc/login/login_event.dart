import "package:dart_mappable/dart_mappable.dart";

part "login_event.mapper.dart";

@MappableClass(discriminatorKey: "event")
sealed class LoginEvent with LoginEventMappable {
  const LoginEvent();
}

@MappableClass(discriminatorValue: "signInWithGoogle")
class LoginEventSignInWithGoogle extends LoginEvent with LoginEventSignInWithGoogleMappable {
  const LoginEventSignInWithGoogle();
}
