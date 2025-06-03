import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/login/register_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/register_event.dart";
import "package:aroma_mobile/presentation/bloc/login/register_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/login/login_loading.dart";
import "package:aroma_mobile/presentation/widget/screen/login/register_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../test_util/test_wrapper.dart";
import "../../../../test_util/testing_mocks.dart";

void main() {
  group("Register Screen", () {
    final router = MockRouter();
    final RegisterBloc bloc = MockRegisterBloc();
    final BuildContext context = FakeBuildContext();
    final RegisterEvent fallback = RegisterEventSignUpWithEmail(email: "", password: "");
    late StreamController<RegisterState> stream;

    setUpAll(() {
      registerFallbackValue(fallback);
    });

    setUp(() {
      stream = StreamController<RegisterState>.broadcast();
      locator.registerSingleton<J1Router>(router);
      registerFallbackValue(context);
      when(() => router.navigate(any(), any())).thenAnswer((_) => Future.value());
      when(bloc.close).thenAnswer((_) => Future.value());
      when(() => bloc.state).thenReturn(const RegisterState());
      when(() => bloc.stream).thenAnswer((_) => stream.stream);
    });

    tearDown(() {
      locator.unregister<J1Router>();
      reset(router);
      reset(bloc);
    });

    testWidgets("handles loading state", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RegisterScreen(),
        ),
      );
      stream.add(const RegisterState(isLoading: true));
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(LoginLoading), findsOneWidget);

      stream.close();
    });

    testWidgets("handles error state", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RegisterScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsNothing);

      stream.add(const RegisterState(error: ErrorCode.common_unknown));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsNothing);

      stream.add(const RegisterState(error: ErrorCode.source_remote_auth_emailSignUpFailed));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);

      stream.close();
    });

    testWidgets("handles register with email", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RegisterScreen(),
        ),
      );
      stream.add(const RegisterState());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(JTextField).at(0), "test@test.com");
      await tester.enterText(find.byType(JTextField).at(1), "password");
      await tester.enterText(find.byType(JTextField).at(2), "password");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(0));
      await tester.pumpAndSettle();

      verify(
        () => bloc.add(
          any(
            that: isA<RegisterEventSignUpWithEmail>()
                .having(
                  (e) => e.email,
                  "email",
                  "test@test.com",
                )
                .having(
                  (e) => e.password,
                  "password",
                  "password",
                ),
          ),
        ),
      ).called(1);
    });

    testWidgets("shows password mismatch error", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RegisterScreen(),
        ),
      );
      stream.add(const RegisterState());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(JTextField).at(0), "test@test.com");
      await tester.enterText(find.byType(JTextField).at(1), "password");
      await tester.enterText(find.byType(JTextField).at(2), "wrong-password");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(0));
      await tester.pumpAndSettle();

      expect(find.text("Passwords do not match"), findsNWidgets(2));
    });

    testWidgets("navigates to sign in screen", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RegisterScreen(),
        ),
      );
      stream.add(const RegisterState());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(JTextField).at(0), "test@test.com");
      await tester.enterText(find.byType(JTextField).at(1), "password");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(1));
      await tester.pumpAndSettle();

      verify(
        () => router.navigate(
          any(),
          AromaRoute.signIn.build(
            EmailPasswordRouteConfig(
              email: "test@test.com",
              password: "password",
            ),
          ),
        ),
      ).called(1);
    });

    testWidgets("hides password entry", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RegisterScreen(),
        ),
      );
      stream.add(const RegisterState());
      await tester.pumpAndSettle();

      final hideFinder = find.byIcon(JamIcons.eye);
      final showFinder = find.byIcon(JamIcons.eyeclosed);

      expect(hideFinder, findsOneWidget);
      expect(showFinder, findsNothing);

      await tester.tap(hideFinder);
      await tester.pumpAndSettle();

      expect(hideFinder, findsNothing);
      expect(showFinder, findsOneWidget);
    });
  });
}
