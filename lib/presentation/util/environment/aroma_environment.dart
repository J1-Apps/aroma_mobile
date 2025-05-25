import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:j1_environment/j1_environment.dart";
import "package:j1_theme/j1_theme.dart";

abstract class AromaEnvironment extends J1Environment {
  // Source
  LocalThemeSource get localThemeSource;

  // Repository
  J1ThemeRepository get themeRepository;

  @override
  Future<void> configure() async {
    await super.configure();

    // Source
    locator.registerSingleton<LocalThemeSource>(localThemeSource);

    // Repository
    locator.registerSingleton<J1ThemeRepository>(themeRepository);
  }
}
