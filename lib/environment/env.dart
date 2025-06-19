import "package:envied/envied.dart";

part "env.g.dart";

@Envied(path: ".env.test")
abstract class TestEnv {
  @EnviedField(varName: "SUPABASE_URL")
  static const String supabaseUrl = _TestEnv.supabaseUrl;

  @EnviedField(varName: "SUPABASE_PUBLIC_KEY")
  static const String supabaseKey = _TestEnv.supabaseKey;

  @EnviedField(varName: "GOOGLE_WEB_CLIENT_ID")
  static const String googleWebClientId = _TestEnv.googleWebClientId;
}

// TODO: Ensure that prod keys are updated from test.
@Envied(path: ".env.prod")
abstract class ProdEnv {
  @EnviedField(varName: "SUPABASE_URL")
  static const String supabaseUrl = _ProdEnv.supabaseUrl;

  @EnviedField(varName: "SUPABASE_PUBLIC_KEY")
  static const String supabaseKey = _ProdEnv.supabaseKey;

  @EnviedField(varName: "GOOGLE_WEB_CLIENT_ID")
  static const String googleWebClientId = _ProdEnv.googleWebClientId;
}
