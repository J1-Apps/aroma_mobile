import "package:equatable/equatable.dart";

sealed class SessionModel extends Equatable {}

class SignedInSessionModel extends SessionModel {
  final String userId;

  SignedInSessionModel({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class SignedOutSessionModel extends SessionModel {
  @override
  List<Object?> get props => [];
}
