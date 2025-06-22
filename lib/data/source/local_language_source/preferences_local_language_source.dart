import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/local_language_source/local_language_source.dart";
import "package:aroma_mobile/data/source/util/default.dart";
import "package:aroma_mobile/data/source/util/preferences_source.dart";
import "package:aroma_mobile/util/string_extension.dart";

class PreferencesLocalLanguageSource extends PreferencesSource implements LocalLanguageSource {
  static const languageKey = "aromaLanguage";

  PreferencesLocalLanguageSource({super.preferences});

  @override
  Future<String> getLanguage() {
    return getItem(languageKey, ErrorCode.source_local_language_readError, (preferences) async {
      final languageJson = await preferences.getString(languageKey);

      if (languageJson == null || languageJson.isBlank) {
        return Default.language;
      }

      return languageJson;
    });
  }

  @override
  Future<void> updateLanguage(String language) async {
    await saveItem(languageKey, ErrorCode.source_local_language_writeError, (preferences) async {
      await preferences.setString(languageKey, language);
    });
  }
}
