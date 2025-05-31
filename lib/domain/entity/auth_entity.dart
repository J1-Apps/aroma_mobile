import "package:aroma_mobile/data/model/session_model.dart";
import "package:equatable/equatable.dart";

sealed class AuthEntity extends Equatable {
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

  const AuthEntitySignedIn({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class AuthEntitySignedOut extends AuthEntity {
  const AuthEntitySignedOut();

  @override
  List<Object?> get props => [];
}
