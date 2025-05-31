import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:equatable/equatable.dart";

class RouterState extends Equatable {
  final AuthEntity auth;

  const RouterState({required this.auth});

  @override
  List<Object?> get props => [auth];
}
