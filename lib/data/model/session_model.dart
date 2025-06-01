import "package:dart_mappable/dart_mappable.dart";

part "session_model.mapper.dart";

@MappableClass(discriminatorKey: "status")
sealed class SessionModel with SessionModelMappable {
  const SessionModel();
}

@MappableClass(discriminatorValue: "signed_in")
class SessionModelSignedIn extends SessionModel with SessionModelSignedInMappable {
  final String userId;

  const SessionModelSignedIn({required this.userId});
}

@MappableClass(discriminatorValue: "signed_out")
class SessionModelSignedOut extends SessionModel with SessionModelSignedOutMappable {
  const SessionModelSignedOut();
}
