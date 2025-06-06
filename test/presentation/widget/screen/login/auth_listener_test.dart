import "dart:async";

import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/presentation/bloc/app/app_bloc.dart";
import "package:aroma_mobile/presentation/bloc/app/app_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/login/auth_listener.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../test_util/test_wrapper.dart";
import "../../../../test_util/testing_mocks.dart";

void main() {
  group("Auth Listener", () {
    final router = MockRouter();
    final AppBloc bloc = MockRouterBloc();
    final BuildContext context = FakeBuildContext();

    setUpAll(() {
      registerFallbackValue(context);
      registerFallbackValue(FakeEmptyRoute());
      registerFallbackValue(const EmptyRouteConfig());
    });

    setUp(() {
      locator.registerSingleton<J1Router>(router);
      when(() => router.navigate<EmptyRouteConfig>(any(), any(), any())).thenAnswer((_) => Future.value());
      when(bloc.close).thenAnswer((_) => Future.value());
    });

    tearDown(() {
      locator.unregister<J1Router>();
      reset(router);
      reset(bloc);
    });

    testWidgets("redirects on login", (tester) async {
      final stream = StreamController<AppState>.broadcast();

      when(() => bloc.state).thenReturn(const AppState(auth: AuthEntitySignedOut(), language: null));
      when(() => bloc.stream).thenAnswer((_) => stream.stream);

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const LoginListener(child: Center(child: Text("hello"))),
        ),
      );
      stream.add(const AppState(auth: AuthEntitySignedOut(), language: null));
      await tester.pumpAndSettle();

      expect(find.text("hello"), findsOneWidget);

      stream.add(const AppState(auth: AuthEntitySignedIn(userId: "123"), language: null));
      await tester.pumpAndSettle();

      verify(() => router.navigate<EmptyRouteConfig>(any(), AromaRoute.recipes, const EmptyRouteConfig())).called(1);

      stream.close();
    });

    testWidgets("redirects on logout", (tester) async {
      final stream = StreamController<AppState>.broadcast();

      when(() => bloc.state).thenReturn(const AppState(auth: AuthEntitySignedIn(userId: "123"), language: null));
      when(() => bloc.stream).thenAnswer((_) => stream.stream);

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const LogoutListener(child: Center(child: Text("hello"))),
        ),
      );
      await tester.pumpAndSettle();

      stream.add(const AppState(auth: AuthEntitySignedIn(userId: "123"), language: null));
      await tester.pumpAndSettle();

      expect(find.text("hello"), findsOneWidget);

      stream.add(const AppState(auth: AuthEntitySignedOut(), language: null));
      await tester.pumpAndSettle();

      verify(() => router.navigate<EmptyRouteConfig>(any(), AromaRoute.login, const EmptyRouteConfig())).called(1);

      stream.close();
    });
  });
}
