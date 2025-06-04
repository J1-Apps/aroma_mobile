import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/usecase/auth/auth_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/language_usecase.dart";
import "package:aroma_mobile/presentation/bloc/app/app_bloc.dart";
import "package:aroma_mobile/presentation/bloc/app/app_event.dart";
import "package:aroma_mobile/presentation/bloc/app/app_state.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";
import "../../../test_util/testing_utils.dart";

void main() {
  group("App Bloc", () {
    final authUsecase = MockAuthUsecase();
    final languageUsecase = MockLanguageUsecase();
    late AppBloc bloc;

    setUp(() {
      locator.registerSingleton<AuthUsecase>(authUsecase);
      locator.registerSingleton<LanguageUsecase>(languageUsecase);
      bloc = AppBloc();
    });

    tearDown(() {
      locator.unregister<AuthUsecase>();
      locator.unregister<LanguageUsecase>();
      reset(authUsecase);
      reset(languageUsecase);
      bloc.close();
    });

    test("auth and language changed events are handled correctly", () async {
      when(authUsecase.call).thenAnswer((_) => Stream.value(const AuthEntitySignedIn(userId: "123")));
      when(languageUsecase.call).thenAnswer((_) => Stream.value("es"));
      expect(bloc.state, const AppState(auth: AuthEntitySignedOut(), language: null));

      bloc.add(const AppEventInit());

      await awaitMs(1);
      expect(
        bloc.state,
        const AppState(
          auth: AuthEntitySignedIn(userId: "123"),
          language: "es",
        ),
      );
    });
  });
}
