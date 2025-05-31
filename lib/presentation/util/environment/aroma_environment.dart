import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:j1_core_firebase/j1_core_firebase.dart";

abstract class AromaEnvironment extends J1EnvironmentFirebase {
  // Source

  LocalThemeSource get localThemeSource;
  RemoteAuthSource get remoteAuthSource;

  // Repository

  J1ThemeRepository get themeRepository;
  AuthRepository get authRepository;

  @override
  Future<void> configure() async {
    await super.configure();

    // Source

    locator.registerSingleton<LocalThemeSource>(localThemeSource);
    locator.registerSingleton<RemoteAuthSource>(remoteAuthSource);

    // Repository
    locator.registerSingleton<J1ThemeRepository>(themeRepository);
    locator.registerSingleton<AuthRepository>(authRepository);

    // Initialize repositories

    await authRepository.init();
  }
}
