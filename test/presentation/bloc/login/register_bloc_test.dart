import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/usecase/auth/create_user_email_usecase.dart";
import "package:aroma_mobile/presentation/bloc/login/register_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/register_event.dart";
import "package:aroma_mobile/presentation/bloc/login/register_state.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";
import "../../../test_util/testing_utils.dart";

void main() {
  group("Register Bloc", () {
    final createUserEmailUsecase = MockCreateUserEmailUsecase();
    late RegisterBloc bloc;

    setUp(() {
      locator.registerSingleton<CreateUserEmailUsecase>(createUserEmailUsecase);
      bloc = RegisterBloc();
    });

    tearDown(() {
      locator.unregister<CreateUserEmailUsecase>();
      reset(createUserEmailUsecase);
      bloc.close();
    });

    test("handles sign up with email", () async {
      when(() => createUserEmailUsecase.call("test@test.com", "password")).thenAnswer(
        (_) => Future.value(const Success(AuthEntitySignedIn(userId: "123"))),
      );

      bloc.add(const RegisterEventSignUpWithEmail(email: "test@test.com", password: "password"));

      await awaitMs(1);
      expect(bloc.state, const RegisterState());
    });

    test("handles sign up with email failure", () async {
      when(() => createUserEmailUsecase.call("test@test.com", "password")).thenAnswer(
        (_) => Future.value(const Failure(ErrorModel(ErrorCode.common_unknown))),
      );

      bloc.add(const RegisterEventSignUpWithEmail(email: "test@test.com", password: "password"));

      await awaitMs(1);
      expect(bloc.state, const RegisterState(error: ErrorCode.common_unknown));
    });
  });
}
