import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_google_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Sign In Google Usecase", () {
    final authRepository = MockAuthRepository();
    late SignInGoogleUsecase signInGoogleUsecase;

    setUpAll(() {
      locator.registerSingleton<AuthRepository>(authRepository);
    });

    setUp(() {
      signInGoogleUsecase = SignInGoogleUsecaseImpl();
    });

    tearDown(() {
      reset(authRepository);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("signs in with Google successfully", () async {
      when(authRepository.signInWithGoogle).thenAnswer((_) => Future.value(const Success("")));
      await signInGoogleUsecase.call();
      verify(authRepository.signInWithGoogle).called(1);
    });
  });
}
