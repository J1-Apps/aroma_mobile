import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_email_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Sign In Email Usecase", () {
    final authRepository = MockAuthRepository();
    late SignInEmailUsecase signInEmailUsecase;

    setUpAll(() {
      locator.registerSingleton<AuthRepository>(authRepository);
    });

    setUp(() {
      signInEmailUsecase = SignInEmailUsecaseImpl();
    });

    tearDown(() {
      reset(authRepository);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("signs in with email and password successfully", () async {
      when(
        () => authRepository.signInWithEmailAndPassword("test@email.com", "password123"),
      ).thenAnswer((_) => Future.value());
      await signInEmailUsecase.call("test@email.com", "password123");
      verify(() => authRepository.signInWithEmailAndPassword("test@email.com", "password123")).called(1);
    });
  });
}
