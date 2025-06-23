import "package:aroma_mobile/data/source/local_language_source/local_language_source.dart";
import "package:aroma_mobile/data/source/local_language_source/memory_local_language_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/memory_local_theme_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/memory_remote_auth_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/memory_remote_recipe_source.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/remote_recipe_source.dart";
import "package:aroma_mobile/data/source/remote_tag_source/memory_remote_tag_source.dart";
import "package:aroma_mobile/data/source/remote_tag_source/remote_tag_source.dart";
import "package:aroma_mobile/environment/aroma_environment.dart";
import "package:firebase_core_platform_interface/firebase_core_platform_interface.dart";
import "package:j1_core_base/j1_core_base.dart";

// This is a configuration file that doesn't need to be tested.
// coverage:ignore-file

class LocalEnvironment extends AromaEnvironment {
  @override
  FirebaseOptions? get firebaseOptions => null;

  @override
  J1CrashHandler get crashHandler => LocalCrashHandler();

  @override
  J1Logger get logger => LocalLogger();

  @override
  J1Router get router => J1RouterGo();

  // Source

  @override
  LocalLanguageSource get localLanguageSource => MemoryLocalLanguageSource();

  @override
  LocalThemeSource get localThemeSource => MemoryLocalThemeSource();

  @override
  RemoteAuthSource get remoteAuthSource => MemoryRemoteAuthSource();

  @override
  RemoteRecipeSource get remoteRecipeSource => MemoryRemoteRecipeSource();

  @override
  RemoteTagSource get remoteTagSource => MemoryRemoteTagSource();
}
