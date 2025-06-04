sealed class SettingsEvent {
  const SettingsEvent();
}

final class SettingsEventInit extends SettingsEvent {
  const SettingsEventInit();
}

final class SettingsEventUpdateLanguage extends SettingsEvent {
  final String language;

  const SettingsEventUpdateLanguage(this.language);
}

final class SettingsEventLanguageUpdated extends SettingsEvent {
  final String language;

  const SettingsEventLanguageUpdated(this.language);
}

final class SettingsEventSignOut extends SettingsEvent {
  const SettingsEventSignOut();
}
