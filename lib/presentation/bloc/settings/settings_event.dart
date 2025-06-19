import "package:dart_mappable/dart_mappable.dart";

part "settings_event.mapper.dart";

@MappableClass(discriminatorKey: "event")
sealed class SettingsEvent with SettingsEventMappable {
  const SettingsEvent();
}

@MappableClass(discriminatorValue: "init")
final class SettingsEventInit extends SettingsEvent with SettingsEventInitMappable {
  const SettingsEventInit();
}

@MappableClass(discriminatorValue: "updateLanguage")
final class SettingsEventUpdateLanguage extends SettingsEvent with SettingsEventUpdateLanguageMappable {
  final String language;

  const SettingsEventUpdateLanguage(this.language);
}

@MappableClass(discriminatorValue: "languageUpdated")
final class SettingsEventLanguageUpdated extends SettingsEvent with SettingsEventLanguageUpdatedMappable {
  final String language;

  const SettingsEventLanguageUpdated(this.language);
}

@MappableClass(discriminatorValue: "signOut")
final class SettingsEventSignOut extends SettingsEvent with SettingsEventSignOutMappable {
  const SettingsEventSignOut();
}
