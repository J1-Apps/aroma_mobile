import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/local_theme_source/preferences_local_theme_source.dart";
import "package:aroma_mobile/presentation/util/theme/aroma_theme.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../../test_util/testing_mocks.dart";
import "../../../test_util/testing_values.dart";

void main() {
  group("Preferences Local Theme Source", () {
    final preferences = MockSharedPreferences();
    late PreferencesLocalThemeSource source;

    setUp(() {
      locator.registerSingleton<SharedPreferencesAsync>(preferences);
      source = PreferencesLocalThemeSource();
    });

    tearDown(() {
      locator.unregister<SharedPreferencesAsync>();
      reset(preferences);
    });

    test("gets and sets color scheme", () async {
      when(() => preferences.setString("aromaColorScheme", any())).thenAnswer((_) => Future.value());
      when(() => preferences.getString("aromaColorScheme")).thenAnswer((_) => Future.value());

      expect(await source.getColorScheme(), AromaColorScheme.light.scheme);
      await source.updateColorScheme(colorScheme0);

      when(() => preferences.getString("aromaColorScheme")).thenAnswer((_) => Future.value(colorScheme0.toJson()));

      expect(await source.getColorScheme(), colorScheme0);
    });

    test("handles get color scheme error", () async {
      when(() => preferences.getString("aromaColorScheme")).thenThrow(StateError("test error"));

      expect(
        () async => source.getColorScheme(),
        throwsA(HasErrorCode(ErrorCode.source_local_theme_colorReadError)),
      );
    });

    test("handles set color scheme error", () async {
      when(() => preferences.setString("aromaColorScheme", any())).thenThrow(StateError("test error"));

      expect(
        () async => source.updateColorScheme(colorScheme0),
        throwsA(HasErrorCode(ErrorCode.source_local_theme_colorWriteError)),
      );
    });

    test("gets and sets text theme", () async {
      when(() => preferences.setString("aromaTextTheme", any())).thenAnswer((_) => Future.value());
      when(() => preferences.getString("aromaTextTheme")).thenAnswer((_) => Future.value());

      expect(await source.getTextTheme(), AromaTextTheme.initial);
      await source.updateTextTheme(textTheme0);

      when(() => preferences.getString("aromaTextTheme")).thenAnswer((_) => Future.value(textTheme0.toJson()));

      expect(await source.getTextTheme(), textTheme0);
    });

    test("handles get text theme error", () async {
      when(() => preferences.getString("aromaTextTheme")).thenThrow(StateError("test error"));

      expect(() async => source.getTextTheme(), throwsA(HasErrorCode(ErrorCode.source_local_theme_textReadError)));
    });

    test("handles set text theme error", () async {
      when(() => preferences.setString("aromaTextTheme", any())).thenThrow(StateError("test error"));

      expect(
        () async => source.updateTextTheme(textTheme0),
        throwsA(HasErrorCode(ErrorCode.source_local_theme_textWriteError)),
      );
    });

    test("gets and sets page transition", () async {
      when(() => preferences.setString("aromaPageTransition", any())).thenAnswer((_) => Future.value());
      when(() => preferences.getString("aromaPageTransition")).thenAnswer((_) => Future.value());

      expect(await source.getPageTransition(), AromaTheme.pageTransition);
      await source.updatePageTransition(pageTransition0);

      when(
        () => preferences.getString("aromaPageTransition"),
      ).thenAnswer((_) => Future.value(pageTransition0.toValue()));

      expect(await source.getPageTransition(), pageTransition0);
    });

    test("handles get page transition error", () async {
      when(() => preferences.getString("aromaPageTransition")).thenThrow(StateError("test error"));

      expect(
        () async => source.getPageTransition(),
        throwsA(HasErrorCode(ErrorCode.source_local_theme_transitionReadError)),
      );
    });

    test("handles set page transition error", () async {
      when(() => preferences.setString("aromaPageTransition", any())).thenThrow(StateError("test error"));

      expect(
        () async => source.updatePageTransition(pageTransition0),
        throwsA(HasErrorCode(ErrorCode.source_local_theme_transitionWriteError)),
      );
    });
  });
}
