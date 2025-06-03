import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

const _crimsonText = "Crimson Text";
const _poppins = "Poppins";

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
      surface: 0xFFE5E3C9,
      onSurface: 0xFF121212,
      background: 0xFFE5E3C9,
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
  crimsonText(_crimsonText),
  poppins(_poppins);

  final String fontFamily;

  const AromaFontFamily(this.fontFamily);
}

abstract class AromaTextTheme {
  static const initial = J1TextTheme(
    displayLarge: J1TextStyle.displayLarge(fontFamily: _crimsonText, fontWeight: J1FontWeight.semiBold),
    displayMedium: J1TextStyle.displayMedium(fontFamily: _crimsonText, fontWeight: J1FontWeight.semiBold),
    displaySmall: J1TextStyle.displaySmall(fontFamily: _crimsonText, fontWeight: J1FontWeight.semiBold),
    headlineLarge: J1TextStyle.headlineLarge(fontFamily: _crimsonText, fontWeight: J1FontWeight.semiBold),
    headlineMedium: J1TextStyle.headlineMedium(fontFamily: _crimsonText, fontWeight: J1FontWeight.semiBold),
    headlineSmall: J1TextStyle.headlineSmall(fontFamily: _crimsonText, fontWeight: J1FontWeight.semiBold),
    titleLarge: J1TextStyle.titleLarge(fontFamily: _poppins, fontWeight: J1FontWeight.medium),
    titleMedium: J1TextStyle.titleMedium(fontFamily: _poppins, fontWeight: J1FontWeight.medium),
    titleSmall: J1TextStyle.titleSmall(fontFamily: _poppins, fontWeight: J1FontWeight.medium),
    bodyLarge: J1TextStyle.bodyLarge(fontFamily: _poppins),
    bodyMedium: J1TextStyle.bodyMedium(fontFamily: _poppins),
    bodySmall: J1TextStyle.bodySmall(fontFamily: _poppins),
    labelLarge: J1TextStyle.labelLarge(fontFamily: _poppins, fontWeight: J1FontWeight.medium),
    labelMedium: J1TextStyle.labelMedium(fontFamily: _poppins, fontWeight: J1FontWeight.medium),
    labelSmall: J1TextStyle.labelSmall(fontFamily: _poppins, fontWeight: J1FontWeight.medium),
  );
}
