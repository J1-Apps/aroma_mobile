import "dart:async";

import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/details/recipe_card_details.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipe_card.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_content.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../../test_util/test_wrapper.dart";
import "../../../../../test_util/testing_mocks.dart";

void main() {
  group("Recipes Content", () {
    final router = MockRouter();
    final RecipesBloc bloc = MockRecipesBloc();
    final BuildContext context = FakeBuildContext();
    late StreamController<RecipesState> stream;

    setUpAll(() {
      registerFallbackValue(context);
      registerFallbackValue(FakeRecipeRoute());
      registerFallbackValue(const RecipeRouteConfig(recipeId: "default"));
    });

    setUp(() {
      stream = StreamController<RecipesState>.broadcast();
      locator.registerSingleton<J1Router>(router);
      when(() => router.navigate<RecipeRouteConfig>(any(), any(), any())).thenAnswer((_) => Future.value());
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

    testWidgets("handles recipe selection and navigation", (tester) async {
      final initialState = RecipesState.initial().copyWith(
        status: RecipesStatus.success,
        recipes: [_recipe1, _recipe2],
      );
      when(() => bloc.state).thenReturn(initialState);

      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const RecipesContent()));

      await tester.tap(find.byType(RecipeCard).first);
      await tester.pumpAndSettle();

      verify(
        () => router.navigate<RecipeRouteConfig>(
          any(),
          AromaRoute.view,
          any(
            that: isA<RecipeRouteConfig>().having(
              (e) => e.recipeId,
              "recipeId",
              _recipe1.id,
            ),
          ),
        ),
      ).called(1);

      await tester.longPress(find.byType(RecipeCard).first);
      await tester.pumpAndSettle();

      verify(() => bloc.add(RecipesEventToggleSelected(recipeId: _recipe1.id))).called(1);

      stream.add(initialState.copyWith(selectedIds: {_recipe1.id}));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(RecipeCard).last);
      await tester.pumpAndSettle();

      verify(() => bloc.add(RecipesEventToggleSelected(recipeId: _recipe2.id))).called(1);

      stream.add(initialState.copyWith(selectedIds: {_recipe1.id, _recipe2.id}));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(RecipeCard).last);
      await tester.pumpAndSettle();

      verify(() => bloc.add(RecipesEventToggleSelected(recipeId: _recipe2.id))).called(1);

      await tester.longPress(find.byType(RecipeCard).last);
      await tester.pumpAndSettle();

      verifyNever(
        () => router.navigate<RecipeRouteConfig>(
          any(),
          AromaRoute.view,
          any(
            that: isA<RecipeRouteConfig>().having(
              (e) => e.recipeId,
              "recipeId",
              _recipe1.id,
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(RecipeCard).first);
    });
  });
}

const _recipe1 = RecipeCardDetails(
  id: "1",
  title: "Recipe 1",
  imageUrl: "https://example.com/image.jpg",
  totalTime: 10,
  servings: 1,
);

const _recipe2 = RecipeCardDetails(
  id: "2",
  title: "Recipe 2",
  imageUrl: "https://example.com/image.jpg",
  totalTime: 15,
  servings: 2,
);
