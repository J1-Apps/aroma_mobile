import "package:dart_mappable/dart_mappable.dart";

part "sign_in_event.mapper.dart";

@MappableClass(discriminatorKey: "event")
sealed class SignInEvent with SignInEventMappable {
  const SignInEvent();
}

@MappableClass(discriminatorValue: "signInWithEmail")
class SignInEventSignInWithEmail extends SignInEvent with SignInEventSignInWithEmailMappable {
  final String email;
  final String password;

  const SignInEventSignInWithEmail({
    required this.email,
    required this.password,
  });
}
