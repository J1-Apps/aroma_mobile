import "package:equatable/equatable.dart";

sealed class SessionModel extends Equatable {
  const SessionModel();
}

class SignedInSessionModel extends SessionModel {
  final String userId;

  const SignedInSessionModel({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class SignedOutSessionModel extends SessionModel {
  const SignedOutSessionModel();

  @override
  List<Object?> get props => [];
}
