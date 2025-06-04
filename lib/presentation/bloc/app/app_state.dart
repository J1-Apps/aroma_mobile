import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:dart_mappable/dart_mappable.dart";

part "app_state.mapper.dart";

@MappableClass()
class AppState with AppStateMappable {
  final AuthEntity auth;
  final String? language;

  const AppState({
    required this.auth,
    required this.language,
  });
}
