import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

const _header = "Crimson Text";
const _body = "Poppins";

abstract class AromaTheme {
  static const scrollPhysics = ClampingScrollPhysics();
  static const pageTransition = J1PageTransition.cupertino;
}

enum AromaColorScheme {
  light(
    J1ColorScheme(
      brightness: J1Brightness.light,
      primary: 0xFF90A578,
      onPrimary: 0xFF121212,
      secondary: 0xFFAEBE9D,
      onSecondary: 0xFF121212,
      tertiary: 0xFF526241,
      onTertiary: 0xFFEEEEEE,
      error: 0xFFB33951,
      onError: 0xFFEEEEEE,
      surface: 0xFFEEEEEE,
      onSurface: 0xFF121212,
      background: 0xFFEEEEEE,
    ),
  ),
  dark(
    J1ColorScheme(
      brightness: J1Brightness.dark,
      primary: 0xFF90A578,
      onPrimary: 0xFF121212,
      secondary: 0xFFAEBE9D,
      onSecondary: 0xFF121212,
      tertiary: 0xFF526241,
      onTertiary: 0xFFEEEEEE,
      error: 0xFFB33951,
      onError: 0xFFEEEEEE,
      surface: 0xFF121212,
      onSurface: 0xFFEEEEEE,
      background: 0xFF121212,
    ),
  ),
  blue(
    J1ColorScheme(
      brightness: J1Brightness.light,
      primary: 0xFF8DA5A5,
      onPrimary: 0xFF111111,
      secondary: 0xFFAFC0C0,
      onSecondary: 0xFF111111,
      tertiary: 0xFF2A324B,
      onTertiary: 0xFFE5E3C9,
      error: 0xFFB33951,
      onError: 0xFFEEEEEE,
      surface: 0xFFE5E3C9,
      onSurface: 0xFF111111,
      background: 0xFFE5E3C9,
    ),
  );

  final J1ColorScheme scheme;

  const AromaColorScheme(this.scheme);
}

enum AromaFontFamily {
  header(_header),
  body(_body);

  final String fontFamily;

  const AromaFontFamily(this.fontFamily);
}

abstract class AromaTextTheme {
  static const initial = J1TextTheme(
    displayLarge: J1TextStyle.displayLarge(fontFamily: _header),
    displayMedium: J1TextStyle.displayMedium(fontFamily: _header),
    displaySmall: J1TextStyle.displaySmall(fontFamily: _header),
    headlineLarge: J1TextStyle.headlineLarge(fontFamily: _header),
    headlineMedium: J1TextStyle.headlineMedium(fontFamily: _header),
    headlineSmall: J1TextStyle.headlineSmall(fontFamily: _header),
    titleLarge: J1TextStyle.titleLarge(fontFamily: _body),
    titleMedium: J1TextStyle.titleMedium(fontFamily: _body),
    titleSmall: J1TextStyle.titleSmall(fontFamily: _body),
    bodyLarge: J1TextStyle.bodyLarge(fontFamily: _body),
    bodyMedium: J1TextStyle.bodyMedium(fontFamily: _body),
    bodySmall: J1TextStyle.bodySmall(fontFamily: _body),
    labelLarge: J1TextStyle.labelLarge(fontFamily: _body),
    labelMedium: J1TextStyle.labelMedium(fontFamily: _body),
    labelSmall: J1TextStyle.labelSmall(fontFamily: _body),
  );
}
