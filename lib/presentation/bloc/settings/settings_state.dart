import "package:aroma_mobile/data/model/error_model.dart";
import "package:dart_mappable/dart_mappable.dart";

part "settings_state.mapper.dart";

@MappableClass()
class SettingsState with SettingsStateMappable {
  final String? language;
  final bool isSigningOut;
  final ErrorCode? error;

  const SettingsState({
    required this.language,
    required this.isSigningOut,
    required this.error,
  });
}
