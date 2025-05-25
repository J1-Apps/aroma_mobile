import "package:aroma_mobile/data/model/aroma_error.dart";
import "package:aroma_mobile/data/repository/theme_repository.dart";
import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/presentation/util/theme/aroma_theme.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_environment/j1_environment.dart";
import "package:mocktail/mocktail.dart";

import "../../test_util/testing_values.dart";

class MockLocalThemeSource extends Mock implements LocalThemeSource {}

void main() {
  group("Theme Repository", () {
    final localSource = MockLocalThemeSource();

    setUpAll(() {
      locator.registerSingleton<LocalThemeSource>(localSource);
      registerFallbackValue(AromaColorScheme.light.scheme);
      registerFallbackValue(AromaTextTheme.initial);
      registerFallbackValue(AromaTheme.pageTransition);
    });

    tearDown(() {
      reset(localSource);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("gets and updates color scheme, handling errors", () async {
      when(localSource.getColorScheme).thenThrow(const AromaError(ErrorCode.source_local_theme_colorReadError));

      final repository = ThemeRepository();

      expect(repository.getColorStream(), emitsInOrder([AromaColorScheme.light.scheme, colorScheme0, colorScheme1]));

      when(
        () => localSource.updateColorScheme(any()),
      ).thenThrow(const AromaError(ErrorCode.source_local_theme_colorWriteError));
      await repository.setColorScheme(colorScheme0);

      when(() => localSource.updateColorScheme(any())).thenAnswer((_) => Future.value());
      await repository.setColorScheme(colorScheme1);

      repository.dispose();
    });

    test("gets and updates text theme, handling errors", () async {
      when(localSource.getTextTheme).thenThrow(const AromaError(ErrorCode.source_local_theme_textReadError));

      final repository = ThemeRepository();

      expect(repository.getTextStream(), emitsInOrder([AromaTextTheme.initial, textTheme0, textTheme1]));

      when(
        () => localSource.updateTextTheme(any()),
      ).thenThrow(const AromaError(ErrorCode.source_local_theme_textWriteError));
      await repository.setTextTheme(textTheme0);

      when(() => localSource.updateTextTheme(any())).thenAnswer((_) => Future.value());
      await repository.setTextTheme(textTheme1);

      repository.dispose();
    });

    test("gets and updates page transition, handling errors", () async {
      when(localSource.getPageTransition).thenThrow(const AromaError(ErrorCode.source_local_theme_transitionReadError));

      final repository = ThemeRepository();

      expect(
        repository.getTransitionStream(),
        emitsInOrder([AromaTheme.pageTransition, pageTransition0, AromaTheme.pageTransition]),
      );

      when(
        () => localSource.updatePageTransition(any()),
      ).thenThrow(const AromaError(ErrorCode.source_local_theme_transitionWriteError));
      await repository.setPageTransition(pageTransition0);

      when(() => localSource.updatePageTransition(any())).thenAnswer((_) => Future.value());
      await repository.setPageTransition(AromaTheme.pageTransition);

      repository.dispose();
    });
  });
}
