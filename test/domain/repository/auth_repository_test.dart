import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/model/session_model.dart";
import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";
import "package:rxdart/rxdart.dart";

import "../../test_util/testing_mocks.dart";
import "../../test_util/testing_utils.dart";

void main() {
  final remoteSource = MockRemoteAuthSource();
  late BehaviorSubject<SessionModel> sessionSubject;
  late AuthRepository authRepository;

  setUp(() async {
    sessionSubject = BehaviorSubject<SessionModel>.seeded(const SessionModelSignedOut());
    when(() => remoteSource.sessionStream).thenAnswer((_) => sessionSubject.stream);
    authRepository = AuthRepositoryImpl(remoteAuthSource: remoteSource);
    await authRepository.init();
  });

  tearDown(() async {
    reset(remoteSource);
    await sessionSubject.close();
    await authRepository.dispose();
  });

  group("AuthRepository", () {
    test("handles error from remote source", () async {
      sessionSubject.add(const SessionModelSignedIn(userId: "test_user"));

      sessionSubject.addError(
        const ErrorModel(
          ErrorCode.source_remote_auth_signOutFailed,
        ),
      );

      await awaitMs(1);

      expectLater(
        authRepository.sessions,
        emitsError(HasErrorCode(ErrorCode.source_remote_auth_signOutFailed)),
      );

      sessionSubject.close();

      await awaitMs(1);

      expect(await authRepository.sessions.first, AuthEntitySignedOut());
    });

    test("should create user with email and password successfully", () async {
      when(
        () => remoteSource.createUserWithEmailAndPassword(
          "test@email.com",
          "password123",
        ),
      ).thenAnswer((_) => Future.value());

      await authRepository.createUserWithEmailAndPassword(
        "test@email.com",
        "password123",
      );

      sessionSubject.add(const SessionModelSignedIn(userId: "test_user"));
      await awaitMs(1);

      final result = await authRepository.sessions.first;

      expect(result, const AuthEntitySignedIn(userId: "test_user"));
      verify(
        () => remoteSource.createUserWithEmailAndPassword(
          "test@email.com",
          "password123",
        ),
      ).called(1);
    });

    test("should throw error on create user with email failure", () async {
      when(
        () => remoteSource.createUserWithEmailAndPassword(
          "test@email.com",
          "password123",
        ),
      ).thenThrow(
        const ErrorModel(
          ErrorCode.source_remote_auth_emailSignUpFailed,
        ),
      );

      await authRepository.createUserWithEmailAndPassword(
        "test@email.com",
        "password123",
      );

      expectLater(
        authRepository.sessions,
        emitsError(HasErrorCode(ErrorCode.source_remote_auth_emailSignUpFailed)),
      );
    });

    test("should sign in with email successfully", () async {
      when(
        () => remoteSource.signInWithEmailAndPassword(
          "test@email.com",
          "password123",
        ),
      ).thenAnswer((_) => Future.value());

      await authRepository.signInWithEmailAndPassword(
        "test@email.com",
        "password123",
      );

      sessionSubject.add(const SessionModelSignedIn(userId: "test_user"));
      await awaitMs(1);

      final result = await authRepository.sessions.first;

      expect(result, const AuthEntitySignedIn(userId: "test_user"));
      verify(
        () => remoteSource.signInWithEmailAndPassword(
          "test@email.com",
          "password123",
        ),
      ).called(1);
    });

    test("should throw error on sign in with email failure", () async {
      when(
        () => remoteSource.signInWithEmailAndPassword(
          "test@email.com",
          "password123",
        ),
      ).thenThrow(
        const ErrorModel(
          ErrorCode.source_remote_auth_emailSignInFailed,
        ),
      );

      await authRepository.signInWithEmailAndPassword(
        "test@email.com",
        "password123",
      );

      expectLater(
        authRepository.sessions,
        emitsError(HasErrorCode(ErrorCode.source_remote_auth_emailSignInFailed)),
      );
    });

    test("should sign in with Google successfully", () async {
      when(remoteSource.signInWithGoogle).thenAnswer((_) => Future.value());

      await authRepository.signInWithGoogle();

      sessionSubject.add(const SessionModelSignedIn(userId: "test_user"));
      await awaitMs(1);

      final result = await authRepository.sessions.first;

      expect(result, const AuthEntitySignedIn(userId: "test_user"));
      verify(remoteSource.signInWithGoogle).called(1);
    });

    test("should throw error on sign in with Google failure", () async {
      when(remoteSource.signInWithGoogle).thenThrow(
        const ErrorModel(
          ErrorCode.source_remote_auth_googleSignInFailed,
        ),
      );

      await authRepository.signInWithGoogle();

      expectLater(
        authRepository.sessions,
        emitsError(HasErrorCode(ErrorCode.source_remote_auth_googleSignInFailed)),
      );
    });

    test("should sign out successfully", () async {
      when(remoteSource.signOut).thenAnswer((_) => Future.value());
      await authRepository.signOut();

      sessionSubject.add(const SessionModelSignedOut());
      await awaitMs(1);

      final result = await authRepository.sessions.first;

      expect(result, const AuthEntitySignedOut());
      verify(remoteSource.signOut).called(1);
    });

    test("should throw error on sign out failure", () async {
      when(remoteSource.signOut).thenThrow(
        const ErrorModel(
          ErrorCode.source_remote_auth_signOutFailed,
        ),
      );

      await authRepository.signOut();

      expectLater(
        authRepository.sessions,
        emitsError(HasErrorCode(ErrorCode.source_remote_auth_signOutFailed)),
      );
    });

    test("should send password reset email successfully", () async {
      when(
        () => remoteSource.sendPasswordResetEmail("test@email.com"),
      ).thenAnswer((_) => Future.value());

      await authRepository.sendPasswordResetEmail("test@email.com");

      verify(
        () => remoteSource.sendPasswordResetEmail("test@email.com"),
      ).called(1);
    });

    test("should throw error on send password reset email failure", () async {
      when(
        () => remoteSource.sendPasswordResetEmail("test@email.com"),
      ).thenThrow(
        const ErrorModel(
          ErrorCode.source_remote_auth_sendPasswordResetEmailFailed,
        ),
      );

      await authRepository.sendPasswordResetEmail("test@email.com");

      expectLater(
        authRepository.sessions,
        emitsError(HasErrorCode(ErrorCode.source_remote_auth_sendPasswordResetEmailFailed)),
      );
    });

    test("should change password successfully", () async {
      when(() => remoteSource.changePassword("password123")).thenAnswer((_) => Future.value());
      await authRepository.changePassword("password123");

      verify(() => remoteSource.changePassword("password123")).called(1);
    });

    test("should throw error on change password failure", () async {
      when(() => remoteSource.changePassword("password123")).thenThrow(
        const ErrorModel(
          ErrorCode.source_remote_auth_changePasswordFailed,
        ),
      );

      await authRepository.changePassword("password123");

      expectLater(
        authRepository.sessions,
        emitsError(HasErrorCode(ErrorCode.source_remote_auth_changePasswordFailed)),
      );
    });

    test("should delete account successfully", () async {
      when(remoteSource.deleteAccount).thenAnswer((_) => Future.value());
      await authRepository.deleteAccount();

      sessionSubject.add(const SessionModelSignedOut());
      await awaitMs(1);

      final result = await authRepository.sessions.first;

      expect(result, const AuthEntitySignedOut());
      verify(remoteSource.deleteAccount).called(1);
    });

    test("should throw error on delete account failure", () async {
      when(remoteSource.deleteAccount).thenThrow(
        const ErrorModel(
          ErrorCode.source_remote_auth_deleteAccountFailed,
        ),
      );

      await authRepository.deleteAccount();

      expectLater(
        authRepository.sessions,
        emitsError(HasErrorCode(ErrorCode.source_remote_auth_deleteAccountFailed)),
      );
    });
  });
}
