import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";
import "package:aroma_mobile/presentation/util/localization/app_localizations.dart";

void main() {
  group("Strings", () {
    test("delegate does not reload", () {
      expect(Strings.delegate.shouldReload(Strings.delegate), false);
    });

    test("lookup strings returns error for unsupported locale", () {
      expect(() => lookupStrings(const Locale("test")), throwsA(isA<FlutterError>()));
    });
  });
}
