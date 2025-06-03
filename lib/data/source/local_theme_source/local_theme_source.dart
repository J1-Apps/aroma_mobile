import "package:j1_core_base/j1_core_base.dart";

abstract class LocalThemeSource {
  Future<J1ColorScheme> getColorScheme();
  Future<void> updateColorScheme(J1ColorScheme colorScheme);

  Future<J1TextTheme> getTextTheme();
  Future<void> updateTextTheme(J1TextTheme textTheme);

  Future<J1PageTransition> getPageTransition();
  Future<void> updatePageTransition(J1PageTransition pageTransition);
}
