import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_out_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Sign Out Usecase", () {
    final authRepository = MockAuthRepository();
    late SignOutUsecase signOutUsecase;

    setUpAll(() {
      locator.registerSingleton<AuthRepository>(authRepository);
    });

    setUp(() {
      signOutUsecase = SignOutUsecaseImpl();
    });

    tearDown(() {
      reset(authRepository);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("signs out successfully", () async {
      when(authRepository.signOut).thenAnswer((_) => Future.value());
      await signOutUsecase.call();
      verify(authRepository.signOut).called(1);
    });
  });
}
