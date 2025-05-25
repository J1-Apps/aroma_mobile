import "package:aroma_mobile/data/repository/theme_repository.dart";
import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/memory_local_theme_source.dart";
import "package:aroma_mobile/presentation/util/environment/aroma_environment.dart";
import "package:firebase_core_platform_interface/firebase_core_platform_interface.dart";
import "package:j1_crash_handler/j1_crash_handler.dart";
import "package:j1_logger/j1_logger.dart";
import "package:j1_router/j1_router.dart";
import "package:j1_theme/repository/j1_theme_repository.dart";

class LocalEnvironment extends AromaEnvironment {
  @override
  FirebaseOptions? get firebaseOptions => null;

  @override
  J1CrashHandler get crashHandler => LocalCrashHandler();

  @override
  J1Logger get logger => LocalLogger();

  @override
  J1Router get router => GoRouter();

  @override
  LocalThemeSource get localThemeSource => MemoryLocalThemeSource();

  @override
  J1ThemeRepository get themeRepository => ThemeRepository();
}
