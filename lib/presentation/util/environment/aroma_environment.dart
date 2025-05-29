import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:j1_core_firebase/j1_core_firebase.dart";

abstract class AromaEnvironment extends J1EnvironmentFirebase {
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
