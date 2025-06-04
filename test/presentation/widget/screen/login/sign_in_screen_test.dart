import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_event.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/login/login_loading.dart";
import "package:aroma_mobile/presentation/widget/screen/login/sign_in_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../test_util/test_wrapper.dart";
import "../../../../test_util/testing_mocks.dart";

void main() {
  group("Sign In Screen", () {
    final router = MockRouter();
    final SignInBloc bloc = MockSignInBloc();
    final BuildContext context = FakeBuildContext();
    final SignInEvent fallback = SignInEventSignInWithEmail(email: "", password: "");
    late StreamController<SignInState> stream;

    setUpAll(() {
      registerFallbackValue(fallback);
    });

    setUp(() {
      stream = StreamController<SignInState>.broadcast();
      locator.registerSingleton<J1Router>(router);
      registerFallbackValue(context);
      when(() => router.navigate(any(), any())).thenAnswer((_) => Future.value());
      when(bloc.close).thenAnswer((_) => Future.value());
      when(() => bloc.state).thenReturn(const SignInState());
      when(() => bloc.stream).thenAnswer((_) => stream.stream);
    });

    tearDown(() {
      locator.unregister<J1Router>();
      reset(router);
      reset(bloc);
      stream.close();
    });

    testWidgets("handles loading state", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const SignInScreen(),
        ),
      );
      stream.add(const SignInState(isLoading: true));
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(LoginLoading), findsOneWidget);
    });

    testWidgets("handles error state", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const SignInScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsNothing);

      stream.add(const SignInState(error: ErrorCode.common_unknown));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsNothing);

      stream.add(const SignInState(error: ErrorCode.source_remote_auth_emailSignInFailed));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets("handles login with email", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const SignInScreen(),
        ),
      );
      stream.add(const SignInState());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(JTextField).at(0), "test@test.com");
      await tester.enterText(find.byType(JTextField).at(1), "password");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(0));
      await tester.pumpAndSettle();

      verify(
        () => bloc.add(
          any(
            that: isA<SignInEventSignInWithEmail>()
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

    testWidgets("navigates to register screen", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const SignInScreen(),
        ),
      );
      stream.add(const SignInState());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(JTextField).at(0), "test@test.com");
      await tester.enterText(find.byType(JTextField).at(1), "password");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(1));
      await tester.pumpAndSettle();

      verify(
        () => router.navigate(
          any(),
          AromaRoute.signUp.build(
            EmailPasswordRouteConfig(
              email: "test@test.com",
              password: "password",
            ),
          ),
        ),
      ).called(1);
    });

    testWidgets("navigates to reset password screen", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const SignInScreen(),
        ),
      );
      stream.add(const SignInState());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(JTextField).at(0), "test@test.com");
      await tester.enterText(find.byType(JTextField).at(1), "password");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(2));
      await tester.pumpAndSettle();

      verify(
        () => router.navigate(
          any(),
          AromaRoute.resetPassword.build(
            EmailRouteConfig(
              email: "test@test.com",
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
          child: const SignInScreen(),
        ),
      );
      stream.add(const SignInState());
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
