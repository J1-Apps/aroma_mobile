import "dart:async";

import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../../test_util/test_wrapper.dart";
import "../../../../../test_util/testing_mocks.dart";

void main() {
  group("Recipes Screen", () {
    final router = MockRouter();
    final RecipesBloc bloc = MockRecipesBloc();
    final BuildContext context = FakeBuildContext();
    late StreamController<RecipesState> stream;

    setUpAll(() {
      registerFallbackValue(context);
      registerFallbackValue(FakeEmptyRoute());
      registerFallbackValue(const EmptyRouteConfig());
    });

    setUp(() {
      stream = StreamController<RecipesState>.broadcast();
      locator.registerSingleton<J1Router>(router);
      when(() => router.push<EmptyRouteConfig>(any(), any(), any())).thenAnswer((_) => Future.value());
      when(bloc.close).thenAnswer((_) => Future.value());
      when(() => bloc.state).thenReturn(RecipesState.initial());
      when(() => bloc.stream).thenAnswer((_) => stream.stream);
    });

    tearDown(() {
      locator.unregister<J1Router>();
      reset(router);
      reset(bloc);
      stream.close();
    });

    testWidgets("navigates to settings", (tester) async {
      when(() => bloc.state).thenReturn(RecipesState.initial().copyWith(status: RecipesStatus.success));

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RecipesScreen(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(JamIcons.cog));
      await tester.pumpAndSettle();

      verify(() => router.push<EmptyRouteConfig>(any(), AromaRoute.settings, const EmptyRouteConfig())).called(1);
    });

    testWidgets("handles pull to refresh", (tester) async {
      when(() => bloc.state).thenReturn(RecipesState.initial().copyWith(status: RecipesStatus.success));

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RecipesScreen(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.drag(find.byType(GridView), Offset(0, 300));
      await tester.pump(const Duration(milliseconds: 500));

      stream.add(RecipesState.initial().copyWith(status: RecipesStatus.loading));
      await tester.pump(const Duration(milliseconds: 500));

      stream.add(RecipesState.initial().copyWith(status: RecipesStatus.success));
      await tester.pumpAndSettle();

      verify(() => bloc.add(const RecipesEventLoad())).called(1);
    });

    testWidgets("handles error state", (tester) async {
      when(() => bloc.state).thenReturn(RecipesState.initial().copyWith(status: RecipesStatus.error));

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RecipesScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(JErrorMessage), findsOneWidget);

      await tester.tap(find.byType(JTextButton));
      await tester.pumpAndSettle();

      verify(() => bloc.add(const RecipesEventLoad())).called(1);
    });

    testWidgets("handles empty state", (tester) async {
      when(() => bloc.state).thenReturn(RecipesState.initial().copyWith(status: RecipesStatus.empty));

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RecipesScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(JErrorMessage), findsOneWidget);

      await tester.tap(find.byType(JTextButton));
      await tester.pumpAndSettle();

      verify(() => router.navigate<EmptyRouteConfig>(any(), AromaRoute.create, const EmptyRouteConfig())).called(1);
    });
  });
}
