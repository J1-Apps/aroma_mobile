import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/reset_password_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Reset Password Usecase", () {
    final authRepository = MockAuthRepository();
    late ResetPasswordUsecase resetPasswordUsecase;

    setUpAll(() {
      locator.registerSingleton<AuthRepository>(authRepository);
    });

    setUp(() {
      resetPasswordUsecase = ResetPasswordUsecaseImpl();
    });

    tearDown(() {
      reset(authRepository);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("sends password reset email successfully", () async {
      when(
        () => authRepository.sendPasswordResetEmail("test@email.com"),
      ).thenAnswer((_) => Future.value(const Success("")));
      await resetPasswordUsecase.call("test@email.com");
      verify(() => authRepository.sendPasswordResetEmail("test@email.com")).called(1);
    });
  });
}
