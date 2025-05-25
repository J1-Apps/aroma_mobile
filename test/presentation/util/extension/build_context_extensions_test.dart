import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/util/localization/app_localizations.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Build Context Extensions", () {
    testWidgets("gets classes from context", (tester) async {
      late BuildContext context;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: Strings.localizationsDelegates,
          supportedLocales: Strings.supportedLocales,
          home: Builder(
            builder: (widgetContext) {
              context = widgetContext;
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      );

      final strings = context.strings();
      final theme = context.theme();
      final colorScheme = context.colorScheme();
      final textTheme = context.textTheme();

      expect(strings, isNotNull);
      expect(theme, isNotNull);
      expect(colorScheme, isNotNull);
      expect(textTheme, isNotNull);
    });
  });
}
