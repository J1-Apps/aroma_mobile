import "package:aroma_mobile/domain/entity/auth_entity.dart";

sealed class AppEvent {
  const AppEvent();
}

class AppEventInit extends AppEvent {
  const AppEventInit();
}

class AppEventAuthChanged extends AppEvent {
  final AuthEntity auth;

  const AppEventAuthChanged(this.auth);
}

class AppEventLanguageChanged extends AppEvent {
  final String? language;

  const AppEventLanguageChanged(this.language);
}
