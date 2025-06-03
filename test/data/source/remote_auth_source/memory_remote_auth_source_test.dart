import "package:aroma_mobile/data/model/session_model.dart";
import "package:aroma_mobile/data/source/remote_auth_source/memory_remote_auth_source.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Memory Remote Auth Source", () {
    late MemoryRemoteAuthSource source;

    setUp(() {
      source = MemoryRemoteAuthSource(initialMsDelay: 1);
    });

    tearDown(() {
      source.onDispose();
    });

    test("creates user with email and password", () async {
      await source.createUserWithEmailAndPassword("test@email.com", "password123");
      expect(await source.sessionStream.first, isA<SessionModelSignedIn>());
    });

    test("signs in user with email and password", () async {
      await source.signInWithEmailAndPassword("test@email.com", "password123");
      expect(await source.sessionStream.first, isA<SessionModelSignedIn>());
    });

    test("signs in user with google", () async {
      await source.signInWithGoogle();
      expect(await source.sessionStream.first, isA<SessionModelSignedIn>());
    });

    test("signs out user", () async {
      await source.createUserWithEmailAndPassword("test@email.com", "password123");
      expect(await source.sessionStream.first, isA<SessionModelSignedIn>());

      await source.signOut();
      expect(await source.sessionStream.first, isA<SessionModelSignedOut>());
    });

    test("sends password reset email", () async {
      await source.sendPasswordResetEmail("test@email.com");
      expect(await source.sessionStream.first, isA<SessionModelSignedOut>());
    });

    test("changes password", () async {
      await source.changePassword("password123");
      expect(await source.sessionStream.first, isA<SessionModelSignedOut>());
    });

    test("deletes account", () async {
      await source.createUserWithEmailAndPassword("test@email.com", "password123");
      expect(await source.sessionStream.first, isA<SessionModelSignedIn>());

      await source.deleteAccount();
      expect(await source.sessionStream.first, isA<SessionModelSignedOut>());
    });
  });
}
