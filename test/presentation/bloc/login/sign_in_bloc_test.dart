import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_email_usecase.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_event.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_state.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";
import "../../../test_util/testing_utils.dart";

void main() {
  group("Sign In Bloc", () {
    final signInEmailUsecase = MockSignInEmailUsecase();
    late SignInBloc bloc;

    setUp(() {
      locator.registerSingleton<SignInEmailUsecase>(signInEmailUsecase);
      bloc = SignInBloc();
    });

    tearDown(() {
      locator.unregister<SignInEmailUsecase>();
      reset(signInEmailUsecase);
      bloc.close();
    });

    test("handles sign in with email", () async {
      when(() => signInEmailUsecase.call("test@test.com", "password")).thenAnswer(
        (_) => Future.value(const Success(AuthEntitySignedIn(userId: "123"))),
      );

      bloc.add(const SignInEventSignInWithEmail(email: "test@test.com", password: "password"));

      await awaitMs(1);
      expect(bloc.state, const SignInState());
    });

    test("handles sign in with email failure", () async {
      when(() => signInEmailUsecase.call("test@test.com", "password")).thenAnswer(
        (_) => Future.value(const Failure(ErrorModel(ErrorCode.common_unknown))),
      );

      bloc.add(const SignInEventSignInWithEmail(email: "test@test.com", password: "password"));

      await awaitMs(1);
      expect(bloc.state, const SignInState(error: ErrorCode.common_unknown));
    });
  });
}
