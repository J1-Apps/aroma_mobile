import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/change_password_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Change Password Usecase", () {
    final authRepository = MockAuthRepository();
    late ChangePasswordUsecase changePasswordUsecase;

    setUpAll(() {
      locator.registerSingleton<AuthRepository>(authRepository);
    });

    setUp(() {
      changePasswordUsecase = ChangePasswordUsecaseImpl();
    });

    tearDown(() {
      reset(authRepository);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("changes password successfully", () async {
      when(() => authRepository.changePassword("newPassword123")).thenAnswer((_) => Future.value());
      await changePasswordUsecase.call("newPassword123");
      verify(() => authRepository.changePassword("newPassword123")).called(1);
    });
  });
}
