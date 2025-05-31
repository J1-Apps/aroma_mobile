import "package:aroma_mobile/data/model/session_model.dart";
import "package:aroma_mobile/data/source/remote_auth_source/memory_remote_auth_source.dart";
import "package:aroma_mobile/data/source/util/memory_source.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Memory Remote Auth Source", () {
    test("creates user with email and password", () async {
      final source = MemoryRemoteAuthSource(initialMsDelay: 1);

      await source.createUserWithEmailAndPassword("test@email.com", "password123");
      expect(await source.sessionStream.first, isA<SessionModelSignedIn>());
    });

    test("signs in user with email and password", () async {
      final source = MemoryRemoteAuthSource(initialMsDelay: 1);

      await source.signInWithEmailAndPassword("test@email.com", "password123");
      expect(await source.sessionStream.first, isA<SessionModelSignedIn>());
    });

    test("signs in user with google", () async {
      final source = MemoryRemoteAuthSource(initialMsDelay: 1);

      await source.signInWithGoogle();
      expect(await source.sessionStream.first, isA<SessionModelSignedIn>());
    });

    test("signs out user", () async {
      final source = MemoryRemoteAuthSource(initialMsDelay: 1);

      await source.createUserWithEmailAndPassword("test@email.com", "password123");
      expect(await source.sessionStream.first, isA<SessionModelSignedIn>());

      await source.signOut();
      expect(await source.sessionStream.first, isA<SessionModelSignedOut>());
    });

    test("sends password reset email", () async {
      final source = MemoryRemoteAuthSource(initialMsDelay: 1);

      await source.sendPasswordResetEmail("test@email.com");
      expect(await source.sessionStream.first, isA<SessionModelSignedOut>());
    });

    test("changes password", () async {
      final source = MemoryRemoteAuthSource(initialMsDelay: 1);

      await source.changePassword("password123");
      expect(await source.sessionStream.first, isA<SessionModelSignedOut>());
    });

    test("deletes account", () async {
      final source = MemoryRemoteAuthSource(initialMsDelay: 1);

      await source.createUserWithEmailAndPassword("test@email.com", "password123");
      expect(await source.sessionStream.first, isA<SessionModelSignedIn>());

      await source.deleteAccount();
      expect(await source.sessionStream.first, isA<SessionModelSignedOut>());
    });

    test("resets", () async {
      final source = MemoryRemoteAuthSource();
      source.msDelay = 1;
      source.shouldThrow = true;

      source.reset();
      expect(source.msDelay, MemorySource.memoryNetworkDelayMs);
      expect(source.shouldThrow, false);
    });
  });
}
