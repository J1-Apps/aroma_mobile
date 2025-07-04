import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/util/preferences_source.dart";
import "package:aroma_mobile/presentation/util/theme/aroma_theme.dart";
import "package:aroma_mobile/util/string_extension.dart";
import "package:j1_core_base/j1_core_base.dart";

const _colorSchemeKey = "aromaColorScheme";
const _textThemeKey = "aromaTextTheme";
const _pageTransitionKey = "aromaPageTransition";

class PreferencesLocalThemeSource extends PreferencesSource implements LocalThemeSource {
  PreferencesLocalThemeSource({super.preferences});

  @override
  Future<J1ColorScheme> getColorScheme() {
    return getItem(_colorSchemeKey, ErrorCode.source_local_theme_colorReadError, (preferences) async {
      final colorSchemeJson = await preferences.getString(_colorSchemeKey);

      if (colorSchemeJson == null || colorSchemeJson.isBlank) {
        return AromaColorScheme.light.scheme;
      }

      return J1ColorScheme.fromJson(colorSchemeJson);
    });
  }

  @override
  Future<void> updateColorScheme(J1ColorScheme colorScheme) async {
    await saveItem(_colorSchemeKey, ErrorCode.source_local_theme_colorWriteError, (preferences) async {
      await preferences.setString(_colorSchemeKey, colorScheme.toJson());
    });
  }

  @override
  Future<J1TextTheme> getTextTheme() {
    return getItem(_textThemeKey, ErrorCode.source_local_theme_textReadError, (preferences) async {
      final textThemeJson = await preferences.getString(_textThemeKey);

      if (textThemeJson == null || textThemeJson.isBlank) {
        return AromaTextTheme.initial;
      }

      return J1TextTheme.fromJson(textThemeJson);
    });
  }

  @override
  Future<void> updateTextTheme(J1TextTheme textTheme) async {
    await saveItem(_textThemeKey, ErrorCode.source_local_theme_textWriteError, (preferences) async {
      await preferences.setString(_textThemeKey, textTheme.toJson());
    });
  }

  @override
  Future<J1PageTransition> getPageTransition() {
    return getItem(_pageTransitionKey, ErrorCode.source_local_theme_transitionReadError, (preferences) async {
      final transitionJson = await preferences.getString(_pageTransitionKey);

      if (transitionJson == null || transitionJson.isBlank) {
        return AromaTheme.pageTransition;
      }

      return J1PageTransition.fromValue(transitionJson);
    });
  }

  @override
  Future<void> updatePageTransition(J1PageTransition pageTransition) async {
    await saveItem(_pageTransitionKey, ErrorCode.source_local_theme_transitionWriteError, (preferences) async {
      await preferences.setString(_pageTransitionKey, pageTransition.toValue());
    });
  }
}
