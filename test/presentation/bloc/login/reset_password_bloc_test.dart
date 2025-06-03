import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/usecase/auth/reset_password_usecase.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_event.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_state.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";
import "../../../test_util/testing_utils.dart";

void main() {
  group("Reset Password Bloc", () {
    final resetPasswordUsecase = MockResetPasswordUsecase();
    late ResetPasswordBloc bloc;

    setUp(() {
      locator.registerSingleton<ResetPasswordUsecase>(resetPasswordUsecase);
      bloc = ResetPasswordBloc();
    });

    tearDown(() {
      locator.unregister<ResetPasswordUsecase>();
      reset(resetPasswordUsecase);
      bloc.close();
    });

    test("handles reset password", () async {
      when(() => resetPasswordUsecase.call("test@test.com")).thenAnswer(
        (_) => Future.value(const Success(AuthEntitySignedOut())),
      );

      bloc.add(const ResetPasswordEventResetPassword(email: "test@test.com"));

      await awaitMs(1);
      expect(bloc.state, const ResetPasswordState(isSuccess: true));
    });

    test("handles reset password failure", () async {
      when(() => resetPasswordUsecase.call("test@test.com")).thenAnswer(
        (_) => Future.value(const Failure(ErrorModel(ErrorCode.common_unknown))),
      );

      bloc.add(const ResetPasswordEventResetPassword(email: "test@test.com"));

      await awaitMs(1);
      expect(bloc.state, const ResetPasswordState(error: ErrorCode.common_unknown));
    });
  });
}
