import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/local_language_source/preferences_local_language_source.dart";
import "package:aroma_mobile/data/source/util/default.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Preferences Local Language Source", () {
    final preferences = MockSharedPreferences();
    late PreferencesLocalLanguageSource source;

    setUp(() {
      locator.registerSingleton<SharedPreferencesAsync>(preferences);
      source = PreferencesLocalLanguageSource();
    });

    tearDown(() {
      locator.unregister<SharedPreferencesAsync>();
      reset(preferences);
    });

    test("gets and sets language", () async {
      when(() => preferences.setString(PreferencesLocalLanguageSource.languageKey, any())).thenAnswer(
        (_) => Future.value(),
      );

      when(() => preferences.getString(PreferencesLocalLanguageSource.languageKey)).thenAnswer(
        (_) => Future.value(),
      );

      expect(await source.getLanguage(), Default.language);
      await source.updateLanguage("kr");

      when(
        () => preferences.getString(PreferencesLocalLanguageSource.languageKey),
      ).thenAnswer((_) => Future.value("kr"));

      expect(await source.getLanguage(), "kr");
      await source.updateLanguage("es");

      when(
        () => preferences.getString(PreferencesLocalLanguageSource.languageKey),
      ).thenAnswer((_) => Future.value("es"));

      expect(await source.getLanguage(), "es");
    });

    test("handles get language error", () async {
      when(() => preferences.getString(PreferencesLocalLanguageSource.languageKey)).thenThrow(
        StateError("test error"),
      );

      expect(
        () async => source.getLanguage(),
        throwsA(HasErrorCode(ErrorCode.source_local_language_readError)),
      );
    });

    test("handles set favorites error", () async {
      when(() => preferences.setString(PreferencesLocalLanguageSource.languageKey, any())).thenThrow(
        StateError("test error"),
      );

      expect(
        () async => source.updateLanguage("kr"),
        throwsA(HasErrorCode(ErrorCode.source_local_language_writeError)),
      );
    });
  });
}
