import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/login/login_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/login_event.dart";
import "package:aroma_mobile/presentation/bloc/login/login_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/login/login_loading.dart";
import "package:aroma_mobile/presentation/widget/screen/login/login_screen.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../test_util/test_wrapper.dart";
import "../../../../test_util/testing_mocks.dart";

void main() {
  group("Login Screen", () {
    final router = MockRouter();
    final LoginBloc bloc = MockLoginBloc();
    final BuildContext context = FakeBuildContext();
    late StreamController<LoginState> stream;

    setUpAll(() {
      registerFallbackValue(context);
      registerFallbackValue(FakeEmailPasswordRoute());
      registerFallbackValue(const EmailPasswordRouteConfig());
    });

    setUp(() {
      stream = StreamController<LoginState>.broadcast();
      locator.registerSingleton<J1Router>(router);
      when(() => router.navigate<EmailPasswordRouteConfig>(any(), any(), any())).thenAnswer((_) => Future.value());
      when(bloc.close).thenAnswer((_) => Future.value());
      when(() => bloc.state).thenReturn(const LoginState());
      when(() => bloc.stream).thenAnswer((_) => stream.stream);
    });

    tearDown(() {
      locator.unregister<J1Router>();
      reset(router);
      reset(bloc);
      stream.close();
    });

    testWidgets("handles loading state", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const LoginScreen()));
      stream.add(const LoginState(isLoading: true));
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(LoginLoading), findsOneWidget);
    });

    testWidgets("handles error state", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const LoginScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsNothing);

      stream.add(const LoginState(error: ErrorCode.common_unknown));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsNothing);

      stream.add(const LoginState(error: ErrorCode.repository_auth_signInWithGoogleFailed));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets("navigates to sign in screen", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const LoginScreen()));
      stream.add(const LoginState());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(0));
      await tester.pumpAndSettle();

      verify(
        () => router.navigate<EmailPasswordRouteConfig>(any(), AromaRoute.signIn, const EmailPasswordRouteConfig()),
      ).called(1);
    });

    testWidgets("navigates to register screen", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const LoginScreen()));
      stream.add(const LoginState());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(1));
      await tester.pumpAndSettle();

      verify(
        () => router.navigate<EmailPasswordRouteConfig>(any(), AromaRoute.signUp, const EmailPasswordRouteConfig()),
      ).called(1);
    });

    testWidgets("handles google sign in", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const LoginScreen()));
      stream.add(const LoginState());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JIconButton).at(0));
      await tester.pumpAndSettle();

      verify(() => bloc.add(const LoginEventSignInWithGoogle())).called(1);
    });

    testWidgets("handles apple sign in", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const LoginScreen()));
      stream.add(const LoginState());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JIconButton).at(1));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets("handles facebook sign in", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const LoginScreen()));
      stream.add(const LoginState());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JIconButton).at(2));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets("handles github sign in", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const LoginScreen()));
      stream.add(const LoginState());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JIconButton).at(3));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets("handles terms of use", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const LoginScreen()));
      final richText = find.byKey(const Key("login_terms"));
      _fireOnTap(richText, "terms of use");
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets("handles privacy policy", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const LoginScreen()));
      final richText = find.byKey(const Key("login_terms"));
      _fireOnTap(richText, "privacy policy");
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}

void _fireOnTap(Finder finder, String text) {
  final element = finder.evaluate().single;
  final paragraph = element.renderObject! as RenderParagraph;

  paragraph.text.visitChildren((span) {
    final textSpan = span as TextSpan;

    if (textSpan.text != text) {
      return true;
    }

    (textSpan.recognizer! as TapGestureRecognizer).onTap!();
    return false;
  });
}
