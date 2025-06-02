import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_google_usecase.dart";
import "package:aroma_mobile/presentation/bloc/login/login_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/login_event.dart";
import "package:aroma_mobile/presentation/bloc/login/login_state.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";
import "../../../test_util/testing_utils.dart";

void main() {
  group("Login Bloc", () {
    final signInGoogleUsecase = MockSignInGoogleUsecase();
    late LoginBloc bloc;

    setUp(() {
      locator.registerSingleton<SignInGoogleUsecase>(signInGoogleUsecase);
      bloc = LoginBloc();
    });

    tearDown(() {
      locator.unregister<SignInGoogleUsecase>();
      reset(signInGoogleUsecase);
      bloc.close();
    });

    test("handles google sign in", () async {
      when(signInGoogleUsecase.call).thenAnswer((_) => Future.value(const Success(AuthEntitySignedIn(userId: "123"))));

      bloc.add(const LoginEventSignInWithGoogle());

      await awaitMs(1);
      expect(bloc.state, const LoginState());
    });

    test("handles google sign in failure", () async {
      when(
        signInGoogleUsecase.call,
      ).thenAnswer((_) => Future.value(const Failure(ErrorModel(ErrorCode.common_unknown))));

      bloc.add(const LoginEventSignInWithGoogle());

      await awaitMs(1);
      expect(bloc.state, const LoginState(error: ErrorCode.common_unknown));
    });
  });
}
