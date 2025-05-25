import "package:aroma_mobile/data/source/local_theme_source/memory_local_theme_source.dart";
import "package:aroma_mobile/presentation/util/theme/aroma_theme.dart";
import "package:flutter_test/flutter_test.dart";

import "../../../test_util/testing_values.dart";

void main() {
  group("Memory Local Theme Source", () {
    test("gets and sets color scheme", () async {
      final source = MemoryLocalThemeSource(initialMsDelay: 1);

      expect(await source.getColorScheme(), AromaColorScheme.light.scheme);

      await source.updateColorScheme(colorScheme0);
      expect(await source.getColorScheme(), colorScheme0);

      await source.updateColorScheme(colorScheme1);
      expect(await source.getColorScheme(), colorScheme1);
    });

    test("gets and sets text theme", () async {
      final source = MemoryLocalThemeSource(initialMsDelay: 1);

      expect(await source.getTextTheme(), AromaTextTheme.initial);

      await source.updateTextTheme(textTheme0);
      expect(await source.getTextTheme(), textTheme0);

      await source.updateTextTheme(textTheme1);
      expect(await source.getTextTheme(), textTheme1);
    });

    test("gets and sets page transition", () async {
      final source = MemoryLocalThemeSource(initialMsDelay: 1);

      expect(await source.getPageTransition(), AromaTheme.pageTransition);

      await source.updatePageTransition(pageTransition0);
      expect(await source.getPageTransition(), pageTransition0);
    });
  });
}
