import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_out_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/language_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/update_language_usecase.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_bloc.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_event.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_state.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";
import "../../../test_util/testing_utils.dart";

void main() {
  group("SettingsBloc", () {
    final languageUsecase = MockLanguageUsecase();
    final updateLanguageUsecase = MockUpdateLanguageUsecase();
    final signOutUsecase = MockSignOutUsecase();
    late SettingsBloc bloc;

    setUp(() {
      locator.registerSingleton<LanguageUsecase>(languageUsecase);
      locator.registerSingleton<UpdateLanguageUsecase>(updateLanguageUsecase);
      locator.registerSingleton<SignOutUsecase>(signOutUsecase);
      bloc = SettingsBloc();
    });

    tearDown(() {
      locator.unregister<LanguageUsecase>();
      locator.unregister<UpdateLanguageUsecase>();
      locator.unregister<SignOutUsecase>();
      reset(languageUsecase);
      reset(updateLanguageUsecase);
      reset(signOutUsecase);
      bloc.close();
    });

    test("language changed event is handled correctly", () async {
      when(languageUsecase.call).thenAnswer((_) => Stream.value("es"));
      expect(bloc.state, const SettingsState(language: null, isSigningOut: false, error: null));

      bloc.add(const SettingsEventInit());

      await awaitMs(1);
      expect(bloc.state, const SettingsState(language: "es", isSigningOut: false, error: null));
    });

    test("update language event is handled correctly", () async {
      when(() => updateLanguageUsecase.call("es")).thenAnswer((_) => Future.value(const Success("")));

      bloc.add(const SettingsEventUpdateLanguage("es"));

      await awaitMs(1);
      expect(bloc.state, const SettingsState(language: null, isSigningOut: false, error: null));
    });

    test("handles update language failure", () async {
      when(() => updateLanguageUsecase.call("es")).thenAnswer(
        (_) => Future.value(const Failure(ErrorModel(ErrorCode.common_unknown))),
      );

      bloc.add(const SettingsEventUpdateLanguage("es"));

      await awaitMs(1);
      expect(bloc.state, const SettingsState(language: null, isSigningOut: false, error: ErrorCode.common_unknown));
    });

    test("sign out event is handled correctly", () async {
      when(signOutUsecase.call).thenAnswer((_) => Future.value(const Success("")));

      bloc.add(const SettingsEventSignOut());

      await awaitMs(1);
      expect(bloc.state, const SettingsState(language: null, isSigningOut: false, error: null));
    });

    test("handles sign out failure", () async {
      when(signOutUsecase.call).thenAnswer((_) => Future.value(const Failure(ErrorModel(ErrorCode.common_unknown))));

      bloc.add(const SettingsEventSignOut());

      await awaitMs(1);
      expect(bloc.state, const SettingsState(language: null, isSigningOut: false, error: ErrorCode.common_unknown));
    });
  });
}
