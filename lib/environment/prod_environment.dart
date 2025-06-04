import "package:aroma_mobile/data/source/local_language_source/local_language_source.dart";
import "package:aroma_mobile/data/source/local_language_source/preferences_local_language_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/data/source/local_theme_source/preferences_local_theme_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:aroma_mobile/data/source/remote_auth_source/supabase_remote_auth_source.dart";
import "package:aroma_mobile/environment/aroma_environment.dart";
import "package:firebase_core_platform_interface/firebase_core_platform_interface.dart";
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
  J1Router get router => GoRouter();

  // Source

  @override
  LocalLanguageSource get localLanguageSource => PreferencesLocalLanguageSource();

  @override
  LocalThemeSource get localThemeSource => PreferencesLocalThemeSource();

  @override
  RemoteAuthSource get remoteAuthSource => SupabaseRemoteAuthSource();

  @override
  Future<void> configure() async {
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseKey,
    );

    await super.configure();
  }
}

const _supabaseUrl = "https://jjjwfgmysctrjddgrjvl.supabase.co";
const _supabaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpqandmZ215c2N0cmpkZGdyanZsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc5MjY0MTcsImV4cCI6MjA2MzUwMjQxN30.7mpJooltvqWFXkVGlRzP3fZB_D5LwFp676X5umlYtEY";
