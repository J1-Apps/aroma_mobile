import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/auth_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Auth Usecase", () {
    final authRepository = MockAuthRepository();
    late AuthUsecase authUsecase;

    setUpAll(() {
      locator.registerSingleton<AuthRepository>(authRepository);
    });

    setUp(() {
      authUsecase = AuthUsecaseImpl();
    });

    tearDown(() {
      reset(authRepository);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("returns a stream of multiple auth entities", () {
      when(() => authRepository.authStream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthEntitySignedOut(),
          const AuthEntitySignedIn(userId: "123"),
          const AuthEntitySignedOut(),
        ]),
      );

      expect(
        authUsecase.call(),
        emitsInOrder([
          const AuthEntitySignedOut(),
          const AuthEntitySignedIn(userId: "123"),
          const AuthEntitySignedOut(),
        ]),
      );
    });
  });
}
