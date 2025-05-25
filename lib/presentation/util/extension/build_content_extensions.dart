import "package:aroma_mobile/presentation/util/localization/app_localizations.dart";
import "package:flutter/material.dart";

extension BuildContextExtensions on BuildContext {
  Strings strings() => Strings.of(this);
  ThemeData theme() => Theme.of(this);
  ColorScheme colorScheme() => Theme.of(this).colorScheme;
  TextTheme textTheme() => Theme.of(this).textTheme;
}
