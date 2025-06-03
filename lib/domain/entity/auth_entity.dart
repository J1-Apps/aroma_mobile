import "package:aroma_mobile/data/model/session_model.dart";
import "package:dart_mappable/dart_mappable.dart";

part "auth_entity.mapper.dart";

@MappableClass(discriminatorKey: "status")
sealed class AuthEntity with AuthEntityMappable {
  const AuthEntity();

  factory AuthEntity.fromModel(SessionModel session) {
    return switch (session) {
      SessionModelSignedIn() => AuthEntitySignedIn(userId: session.userId),
      SessionModelSignedOut() => AuthEntitySignedOut(),
    };
  }
}

@MappableClass(discriminatorValue: "signed_in")
class AuthEntitySignedIn extends AuthEntity with AuthEntitySignedInMappable {
  final String userId;

  const AuthEntitySignedIn({required this.userId});
}

@MappableClass(discriminatorValue: "signed_out")
class AuthEntitySignedOut extends AuthEntity with AuthEntitySignedOutMappable {
  const AuthEntitySignedOut();
}
