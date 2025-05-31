import "package:aroma_mobile/domain/repository/auth_repository.dart";
import "package:aroma_mobile/domain/usecase/auth/delete_account_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Delete Account Usecase", () {
    final authRepository = MockAuthRepository();
    late DeleteAccountUsecase deleteAccountUsecase;

    setUpAll(() {
      locator.registerSingleton<AuthRepository>(authRepository);
    });

    setUp(() {
      deleteAccountUsecase = DeleteAccountUsecaseImpl();
    });

    tearDown(() {
      reset(authRepository);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("deletes account successfully", () async {
      when(authRepository.deleteAccount).thenAnswer((_) => Future.value());
      await deleteAccountUsecase.call();
      verify(authRepository.deleteAccount).called(1);
    });
  });
}
