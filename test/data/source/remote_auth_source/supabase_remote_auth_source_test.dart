import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/model/session_model.dart";
import "package:aroma_mobile/data/source/remote_auth_source/supabase_remote_auth_source.dart";
import "package:flutter_test/flutter_test.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:mocktail/mocktail.dart";
import "package:supabase_flutter/supabase_flutter.dart";

import "../../../test_util/testing_mocks.dart";

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockAuthClient extends Mock implements GoTrueClient {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAuthentication extends Mock implements GoogleSignInAuthentication {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

void main() {
  final supabase = MockSupabaseClient();
  final googleSignIn = MockGoogleSignIn();
  final auth = MockAuthClient();
  late SupabaseRemoteAuthSource source;

  setUp(() {
    source = SupabaseRemoteAuthSource(
      supabase: supabase,
      googleSignIn: googleSignIn,
    );

    when(() => supabase.auth).thenReturn(auth);
  });

  tearDown(() {
    reset(supabase);
    reset(googleSignIn);
    reset(auth);
  });

  group("Supabase Remote Auth Source", () {
    test("creates user with email and password", () async {
      final authStream = StreamController<AuthState>();

      when(() => auth.signUp(email: "test@email.com", password: "password123")).thenAnswer(
        (_) async => AuthResponse(session: _session),
      );

      when(() => auth.onAuthStateChange).thenAnswer((_) => authStream.stream);

      await source.createUserWithEmailAndPassword("test@email.com", "password123");
      authStream.add(AuthState(AuthChangeEvent.signedIn, _session));
      final session = await source.sessionStream.first;

      verify(() => auth.signUp(email: "test@email.com", password: "password123")).called(1);
      expect((session as SignedInSessionModel).userId, "1");

      authStream.close();
    });

    test("creates user with email and password fails", () async {
      when(() => auth.signUp(email: "test@email.com", password: "password123")).thenAnswer(
        (_) async => AuthResponse(),
      );

      await expectLater(
        () => source.createUserWithEmailAndPassword("test@email.com", "password123"),
        throwsA(HasErrorCode(ErrorCode.source_remote_auth_emailSignUpFailed)),
      );
    });

    test("signs in with email and password", () async {
      final authStream = StreamController<AuthState>();

      when(() => auth.signInWithPassword(email: "test@email.com", password: "password123")).thenAnswer(
        (_) async => AuthResponse(session: _session),
      );

      when(() => auth.onAuthStateChange).thenAnswer((_) => authStream.stream);

      await source.signInWithEmailAndPassword("test@email.com", "password123");
      authStream.add(AuthState(AuthChangeEvent.signedIn, _session));
      final session = await source.sessionStream.first;

      verify(() => auth.signInWithPassword(email: "test@email.com", password: "password123")).called(1);
      expect((session as SignedInSessionModel).userId, "1");

      authStream.close();
    });

    test("signs in with email and password fails", () async {
      when(() => auth.signInWithPassword(email: "test@email.com", password: "password123")).thenAnswer(
        (_) async => AuthResponse(),
      );

      await expectLater(
        () => source.signInWithEmailAndPassword("test@email.com", "password123"),
        throwsA(HasErrorCode(ErrorCode.source_remote_auth_emailSignInFailed)),
      );
    });

    test("signs in with Google", () async {
      final authStream = StreamController<AuthState>();
      final googleAuth = MockGoogleSignInAuthentication();
      final googleUser = MockGoogleSignInAccount();

      when(googleSignIn.signIn).thenAnswer((_) async => googleUser);
      when(() => googleAuth.accessToken).thenReturn("google_access_token");
      when(() => googleAuth.idToken).thenReturn("google_id_token");
      when(() => googleUser.authentication).thenAnswer((_) async => googleAuth);

      when(
        () => auth.signInWithIdToken(
          provider: OAuthProvider.google,
          accessToken: "google_access_token",
          idToken: "google_id_token",
        ),
      ).thenAnswer(
        (_) async => AuthResponse(session: _session),
      );

      when(() => auth.onAuthStateChange).thenAnswer((_) => authStream.stream);

      await source.signInWithGoogle();
      authStream.add(AuthState(AuthChangeEvent.signedIn, _session));
      final session = await source.sessionStream.first;

      verify(
        () => auth.signInWithIdToken(
          provider: OAuthProvider.google,
          accessToken: "google_access_token",
          idToken: "google_id_token",
        ),
      ).called(1);
      expect((session as SignedInSessionModel).userId, "1");

      authStream.close();
    });

    test("signs in with Google fails", () async {
      when(googleSignIn.signIn).thenAnswer((_) async => null);

      await expectLater(
        () => source.signInWithGoogle(),
        throwsA(HasErrorCode(ErrorCode.source_remote_auth_googleSignInFailed)),
      );
    });

    test("signs in with Google fails with null session", () async {
      final googleAuth = MockGoogleSignInAuthentication();
      final googleUser = MockGoogleSignInAccount();

      when(googleSignIn.signIn).thenAnswer((_) async => googleUser);
      when(() => googleAuth.accessToken).thenReturn("google_access_token");
      when(() => googleAuth.idToken).thenReturn("google_id_token");
      when(() => googleUser.authentication).thenAnswer((_) async => googleAuth);

      when(
        () => auth.signInWithIdToken(
          provider: OAuthProvider.google,
          accessToken: "google_access_token",
          idToken: "google_id_token",
        ),
      ).thenAnswer(
        (_) async => AuthResponse(),
      );

      await expectLater(
        () => source.signInWithGoogle(),
        throwsA(HasErrorCode(ErrorCode.source_remote_auth_googleSignInFailed)),
      );
    });

    test("signs out", () async {
      when(auth.signOut).thenAnswer((_) async => AuthResponse(session: _session));

      await source.signOut();
      verify(auth.signOut).called(1);
    });

    test("sends password reset email", () async {
      when(() => auth.resetPasswordForEmail("test@email.com")).thenAnswer((_) async => AuthResponse(session: _session));

      await source.sendPasswordResetEmail("test@email.com");
      verify(() => auth.resetPasswordForEmail("test@email.com")).called(1);
    });

    test("changes password", () async {
      when(
        () => auth.updateUser(UserAttributes(password: "password123")),
      ).thenAnswer((_) async => UserResponse.fromJson({"id": "1"}));

      await source.changePassword("password123");
      verify(() => auth.updateUser(UserAttributes(password: "password123"))).called(1);
    });

    test("deletes account", () async {
      await source.deleteAccount();
    });
  });
}

final _session = Session(
  user: User(
    id: "1",
    appMetadata: {},
    userMetadata: {},
    aud: "",
    createdAt: "",
  ),
  accessToken: "accessToken",
  refreshToken: "refreshToken",
  tokenType: "tokenType",
);
