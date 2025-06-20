import "package:aroma_mobile/data/source/local_language_source/local_language_source.dart";
import "package:aroma_mobile/data/source/local_language_source/preferences_local_language_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/preferences_local_theme_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/supabase_remote_auth_source.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/remote_recipe_source.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/supabase_remote_recipe_source.dart";
import "package:aroma_mobile/data/source/remote_tag_source/remote_tag_source.dart";
import "package:aroma_mobile/data/source/remote_tag_source/supabase_remote_tag_source.dart";
import "package:aroma_mobile/environment/aroma_environment.dart";
import "package:aroma_mobile/environment/env.dart";
import "package:firebase_core_platform_interface/firebase_core_platform_interface.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:supabase_flutter/supabase_flutter.dart";

// TODO: Update this class to use the production environment
class ProdEnvironment extends AromaEnvironment {
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
  LocalLanguageSource get localLanguageSource => PreferencesLocalLanguageSource();

  @override
  LocalThemeSource get localThemeSource => PreferencesLocalThemeSource();

  @override
  RemoteAuthSource get remoteAuthSource => SupabaseRemoteAuthSource(
    googleSignIn: GoogleSignIn(serverClientId: ProdEnv.googleWebClientId),
  );

  @override
  RemoteRecipeSource get remoteRecipeSource => SupabaseRemoteRecipeSource();

  @override
  RemoteTagSource get remoteTagSource => SupabaseRemoteTagSource();

  @override
  Future<void> configure() async {
    await Supabase.initialize(
      url: ProdEnv.supabaseUrl,
      anonKey: ProdEnv.supabaseKey,
    );

    await super.configure();
  }
}
