import "dart:async";

import "package:aroma_mobile/app.dart";
import "package:aroma_mobile/data/source/util/memory_source.dart";
import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/domain/usecase/auth/auth_usecase.dart";
import "package:aroma_mobile/domain/usecase/auth/sign_in_google_usecase.dart";
import "package:aroma_mobile/domain/usecase/language/language_usecase.dart";
import "package:aroma_mobile/presentation/widget/screen/login/login_screen.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "test_util/testing_mocks.dart";

void main() {
  group("Currency Converter App", () {
    late StreamController<J1ColorScheme> colorSchemeStream;
    late StreamController<J1TextTheme> textThemeStream;
    late StreamController<J1PageTransition> pageTransitionStream;
    final themeRepository = MockThemeRepository();

    final authUsecase = MockAuthUsecase();
    final languageUsecase = MockLanguageUsecase();
    final signInGoogleUsecase = MockSignInGoogleUsecase();

    setUp(() {
      colorSchemeStream = StreamController<J1ColorScheme>.broadcast();
      textThemeStream = StreamController<J1TextTheme>.broadcast();
      pageTransitionStream = StreamController<J1PageTransition>.broadcast();
      when(themeRepository.getColorStream).thenAnswer((_) => colorSchemeStream.stream);
      when(themeRepository.getTextStream).thenAnswer((_) => textThemeStream.stream);
      when(themeRepository.getTransitionStream).thenAnswer((_) => pageTransitionStream.stream);
      locator.registerSingleton<J1ThemeRepository>(themeRepository);

      locator.registerSingleton<AuthUsecase>(authUsecase);
      locator.registerSingleton<LanguageUsecase>(languageUsecase);
      locator.registerSingleton<SignInGoogleUsecase>(signInGoogleUsecase);
    });

    tearDown(() {
      locator.unregister<J1ThemeRepository>();
      colorSchemeStream.close();
      textThemeStream.close();
      pageTransitionStream.close();

      locator.unregister<AuthUsecase>();
      locator.unregister<LanguageUsecase>();
      locator.unregister<SignInGoogleUsecase>();
    });

    testWidgets("builds and displays the home page", (tester) async {
      when(authUsecase.call).thenAnswer((_) => Stream.value(const AuthEntitySignedOut()));
      when(languageUsecase.call).thenAnswer((_) => Stream.value("en"));

      await tester.pumpWidget(AromaApp());
      await tester.pumpAndSettle(const Duration(milliseconds: MemorySource.memoryNetworkDelayMs));

      expect(find.byType(LoginScreen), findsOneWidget);
    });
  });
}
