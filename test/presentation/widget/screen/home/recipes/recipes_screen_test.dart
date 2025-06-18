import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_screen.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../../test_util/test_wrapper.dart";
import "../../../../../test_util/testing_mocks.dart";

void main() {
  group("Recipes Screen", () {
    final router = MockRouter();

    setUpAll(() {
      registerFallbackValue(FakeBuildContext());
      registerFallbackValue(FakeEmptyRoute());
      registerFallbackValue(const EmptyRouteConfig());
    });

    setUp(() {
      when(() => router.push<EmptyRouteConfig>(any(), any(), any())).thenAnswer((_) => Future.value());
      locator.registerSingleton<J1Router>(router);
    });

    tearDown(() {
      locator.unregister<J1Router>();
      reset(router);
    });

    testWidgets("navigates to settings", (tester) async {
      final bloc = RecipesBloc();
      bloc.add(const RecipesEventLoad());

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
  });
}
