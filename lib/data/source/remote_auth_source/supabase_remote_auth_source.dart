import "package:aroma_mobile/data/model/error_model.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:aroma_mobile/data/model/session_model.dart";
import "package:aroma_mobile/data/source/remote_auth_source/remote_auth_source.dart";
import "package:supabase_flutter/supabase_flutter.dart";

const _googleWebClientId = "1099253870542-8o2c2nfedtf3nk4dht2d9uljbuofo94f.apps.googleusercontent.com";

class SupabaseRemoteAuthSource implements RemoteAuthSource {
  final SupabaseClient _supabase;
  final GoogleSignIn _googleSignIn;

  // coverage:ignore-start
  SupabaseRemoteAuthSource({
    SupabaseClient? supabase,
    GoogleSignIn? googleSignIn,
  }) : _supabase = supabase ?? Supabase.instance.client,
       // TODO: Add web client IDs
       _googleSignIn = googleSignIn ?? GoogleSignIn(serverClientId: _googleWebClientId);
  // coverage:ignore-end

  @override
  Stream<SessionModel> get sessionStream => _supabase.auth.onAuthStateChange.map(
    (event) {
      final session = event.session;

      if (session == null) {
        return const SessionModelSignedOut();
      }

      return SessionModelSignedIn(userId: session.user.id);
    },
  );

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
    );

    if (response.session == null) {
      throw ErrorModel(
        ErrorCode.source_remote_auth_emailSignUpFailed,
        message: "Supabase email sign up failed",
      );
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.session == null) {
      throw ErrorModel(
        ErrorCode.source_remote_auth_emailSignInFailed,
        message: "Supabase email sign in failed",
      );
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;

    final accessToken = googleAuth?.accessToken;
    final idToken = googleAuth?.idToken;

    if (accessToken == null || idToken == null) {
      throw ErrorModel(
        ErrorCode.source_remote_auth_googleSignInFailed,
        message: "Google sign in failed",
      );
    }

    final response = await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      accessToken: accessToken,
      idToken: idToken,
    );

    if (response.session == null) {
      throw ErrorModel(
        ErrorCode.source_remote_auth_googleSignInFailed,
        message: "Supabase Google sign in failed",
      );
    }
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> changePassword(String password) async {
    await _supabase.auth.updateUser(
      UserAttributes(password: password),
    );
  }

  @override
  Future<void> deleteAccount() async {
    // TODO: Implement delete account
  }

  @override
  Future<void> onDispose() async {}
}
