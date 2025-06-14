import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_event.dart";
import "package:aroma_mobile/presentation/bloc/login/reset_password_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/login/login_loading.dart";
import "package:aroma_mobile/presentation/widget/screen/login/reset_password_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../test_util/test_wrapper.dart";
import "../../../../test_util/testing_mocks.dart";

void main() {
  group("Reset Password Screen", () {
    final router = MockRouter();
    final ResetPasswordBloc bloc = MockResetPasswordBloc();
    final BuildContext context = FakeBuildContext();
    final ResetPasswordEvent fallback = ResetPasswordEventResetPassword(email: "");
    late StreamController<ResetPasswordState> stream;

    setUpAll(() {
      registerFallbackValue(context);
      registerFallbackValue(fallback);
      registerFallbackValue(FakeEmailRoute());
      registerFallbackValue(const EmailRouteConfig());
      registerFallbackValue(FakeEmailPasswordRoute());
      registerFallbackValue(const EmailPasswordRouteConfig());
    });

    setUp(() {
      stream = StreamController<ResetPasswordState>.broadcast();
      locator.registerSingleton<J1Router>(router);
      when(() => router.navigate<EmailRouteConfig>(any(), any(), any())).thenAnswer((_) => Future.value());
      when(bloc.close).thenAnswer((_) => Future.value());
      when(() => bloc.state).thenReturn(const ResetPasswordState());
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
          child: const ResetPasswordScreen(),
        ),
      );
      stream.add(const ResetPasswordState(isLoading: true));
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
          child: const ResetPasswordScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsNothing);

      stream.add(const ResetPasswordState(error: ErrorCode.common_unknown));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsNothing);

      stream.add(const ResetPasswordState(error: ErrorCode.source_remote_auth_sendPasswordResetEmailFailed));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets("handles reset password", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const ResetPasswordScreen(),
        ),
      );
      stream.add(const ResetPasswordState());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(JTextField).at(0), "test@test.com");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(0));
      await tester.pumpAndSettle();

      verify(
        () => bloc.add(
          any(
            that: isA<ResetPasswordEventResetPassword>().having(
              (event) => event.email,
              "email",
              "test@test.com",
            ),
          ),
        ),
      ).called(1);
    });

    testWidgets("handles success state", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const ResetPasswordScreen(),
        ),
      );

      await tester.enterText(find.byType(JTextField).at(0), "test@test.com");
      await tester.pumpAndSettle();

      stream.add(const ResetPasswordState(isSuccess: true));
      await tester.pumpAndSettle();

      verify(
        () => router.navigate<EmailPasswordRouteConfig>(
          any(),
          AromaRoute.signIn,
          any(
            that: isA<EmailPasswordRouteConfig>()
                .having((e) => e.email, "email", "")
                .having((e) => e.password, "password", ""),
          ),
        ),
      ).called(1);
    });

    testWidgets("navigates to sign in screen", (tester) async {
      tester.view.physicalSize = const Size(600, 1200);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const ResetPasswordScreen(),
        ),
      );
      stream.add(const ResetPasswordState());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(JTextField).at(0), "test@test.com");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(1));
      await tester.pumpAndSettle();

      verify(
        () => router.navigate<EmailPasswordRouteConfig>(
          any(),
          AromaRoute.signIn,
          any(
            that: isA<EmailPasswordRouteConfig>()
                .having((e) => e.email, "email", "test@test.com")
                .having((e) => e.password, "password", ""),
          ),
        ),
      ).called(1);
    });
  });
}
