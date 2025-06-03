import "package:aroma_mobile/presentation/util/localization/app_localizations.dart";
import "package:flutter/material.dart";

extension BuildContextExtensions on BuildContext {
  Strings strings() => Strings.of(this);
}
