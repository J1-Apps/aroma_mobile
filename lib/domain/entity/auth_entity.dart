import "package:aroma_mobile/data/model/session_model.dart";

sealed class AuthEntity {
  const AuthEntity();

  factory AuthEntity.fromModel(SessionModel session) {
    switch (session) {
      case SessionModelSignedIn():
        return AuthEntitySignedIn(userId: session.userId);
      case SessionModelSignedOut():
        return AuthEntitySignedOut();
    }
  }
}

class AuthEntitySignedIn extends AuthEntity {
  final String userId;

  AuthEntitySignedIn({required this.userId});
}

class AuthEntitySignedOut extends AuthEntity {}
