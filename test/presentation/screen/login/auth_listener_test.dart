import "dart:async";

import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/presentation/bloc/router/router_bloc.dart";
import "package:aroma_mobile/presentation/bloc/router/router_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/screen/login/auth_listener.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/test_wrapper.dart";
import "../../../test_util/testing_mocks.dart";

void main() {
  group("Auth Listener", () {
    final router = MockRouter();
    final RouterBloc bloc = MockRouterBloc();
    final BuildContext context = FakeBuildContext();

    setUp(() {
      locator.registerSingleton<J1Router>(router);
      registerFallbackValue(context);
      when(() => router.navigate(any(), any())).thenAnswer((_) => Future.value());
      when(bloc.close).thenAnswer((_) => Future.value());
    });

    tearDown(() {
      locator.unregister<J1Router>();
      reset(router);
      reset(bloc);
    });

    testWidgets("redirects on login", (tester) async {
      final stream = StreamController<RouterState>.broadcast();

      when(() => bloc.state).thenReturn(const RouterState(auth: AuthEntitySignedOut()));
      when(() => bloc.stream).thenAnswer((_) => stream.stream);

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const LoginListener(child: Center(child: Text("hello"))),
        ),
      );
      stream.add(const RouterState(auth: AuthEntitySignedOut()));
      await tester.pumpAndSettle();

      expect(find.text("hello"), findsOneWidget);

      stream.add(const RouterState(auth: AuthEntitySignedIn(userId: "123")));
      await tester.pumpAndSettle();

      verify(() => router.navigate(any(), AromaRoute.home.build(const EmptyRouteConfig()))).called(1);

      stream.close();
    });

    testWidgets("redirects on logout", (tester) async {
      final stream = StreamController<RouterState>.broadcast();

      when(() => bloc.state).thenReturn(const RouterState(auth: AuthEntitySignedIn(userId: "123")));
      when(() => bloc.stream).thenAnswer((_) => stream.stream);

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const LogoutListener(child: Center(child: Text("hello"))),
        ),
      );
      await tester.pumpAndSettle();

      stream.add(const RouterState(auth: AuthEntitySignedIn(userId: "123")));
      await tester.pumpAndSettle();

      expect(find.text("hello"), findsOneWidget);

      stream.add(const RouterState(auth: AuthEntitySignedOut()));
      await tester.pumpAndSettle();

      verify(() => router.navigate(any(), AromaRoute.login.build(const EmptyRouteConfig()))).called(1);

      stream.close();
    });
  });
}
