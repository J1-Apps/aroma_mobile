import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:dart_mappable/dart_mappable.dart";

part "app_event.mapper.dart";

@MappableClass(discriminatorKey: "event")
sealed class AppEvent with AppEventMappable {
  const AppEvent();
}

@MappableClass(discriminatorValue: "init")
class AppEventInit extends AppEvent with AppEventInitMappable {
  const AppEventInit();
}

@MappableClass(discriminatorValue: "authChanged")
class AppEventAuthChanged extends AppEvent with AppEventAuthChangedMappable {
  final AuthEntity auth;

  const AppEventAuthChanged(this.auth);
}

@MappableClass(discriminatorValue: "languageChanged")
class AppEventLanguageChanged extends AppEvent with AppEventLanguageChangedMappable {
  final String? language;

  const AppEventLanguageChanged(this.language);
}
