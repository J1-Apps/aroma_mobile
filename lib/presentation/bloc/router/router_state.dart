import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:dart_mappable/dart_mappable.dart";

part "router_state.mapper.dart";

@MappableClass()
class RouterState with RouterStateMappable {
  final AuthEntity auth;

  const RouterState({required this.auth});
}
