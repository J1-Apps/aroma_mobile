import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/memory_local_theme_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/memory_remote_auth_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/presentation/util/environment/aroma_environment.dart";
import "package:firebase_core_platform_interface/firebase_core_platform_interface.dart";
import "package:j1_core_base/j1_core_base.dart";

class LocalEnvironment extends AromaEnvironment {
  @override
  FirebaseOptions? get firebaseOptions => null;

  @override
  J1CrashHandler get crashHandler => LocalCrashHandler();

  @override
  J1Logger get logger => LocalLogger();

  @override
  J1Router get router => GoRouter();

  // Source

  @override
  LocalThemeSource get localThemeSource => MemoryLocalThemeSource();

  @override
  RemoteAuthSource get remoteAuthSource => MemoryRemoteAuthSource();
}
