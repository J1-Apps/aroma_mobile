import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/create_user_email_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Create User Email Usecase", () {
    final authRepository = MockAuthRepository();
    late CreateUserEmailUsecase createUserEmailUsecase;

    setUpAll(() {
      locator.registerSingleton<AuthRepository>(authRepository);
    });

    setUp(() {
      createUserEmailUsecase = CreateUserEmailUsecaseImpl();
    });

    tearDown(() {
      reset(authRepository);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("creates user with email and password successfully", () async {
      when(
        () => authRepository.createUserWithEmailAndPassword("test@email.com", "password123"),
      ).thenAnswer((_) => Future.value(const Success("")));
      await createUserEmailUsecase.call("test@email.com", "password123");
      verify(() => authRepository.createUserWithEmailAndPassword("test@email.com", "password123")).called(1);
    });
  });
}
