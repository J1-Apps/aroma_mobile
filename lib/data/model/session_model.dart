import "package:equatable/equatable.dart";

sealed class SessionModel extends Equatable {
  const SessionModel();
}

class SessionModelSignedIn extends SessionModel {
  final String userId;

  const SessionModelSignedIn({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class SessionModelSignedOut extends SessionModel {
  const SessionModelSignedOut();

  @override
  List<Object?> get props => [];
}
