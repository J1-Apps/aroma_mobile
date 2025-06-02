import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_bloc.dart";
import "package:aroma_mobile/presentation/bloc/login/sign_in_state.dart";
import "package:aroma_mobile/presentation/screen/login/login_loading.dart";
import "package:aroma_mobile/presentation/screen/login/sign_in_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/test_wrapper.dart";
import "../../../test_util/testing_mocks.dart";

void main() {
  group("Sign In Screen", () {
    final router = MockRouter();
    final SignInBloc bloc = MockSignInBloc();
    final BuildContext context = FakeBuildContext();
    late StreamController<SignInState> stream;

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

      stream.close();
    });
  });
}
