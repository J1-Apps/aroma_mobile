import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/util/memory_data.dart";
import "package:aroma_mobile/domain/entity/difficulty_entity.dart";
import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/recipe_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:aroma_mobile/domain/usecase/recipe/delete_recipes_usecase.dart";
import "package:aroma_mobile/domain/usecase/recipe/recipes_usecase.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/details/recipe_card_details.dart";
import "package:aroma_mobile/util/none.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";
import "../../../test_util/testing_utils.dart";

final _filterEntity = FilterEntity(
  ratingMin: 1,
  timeMin: 2,
  timeMax: 3,
  servingsMin: 4,
  servingsMax: 5,
  difficulties: {DifficultyEntity.easy, DifficultyEntity.medium},
  tags: {
    TagEntity(id: 1, name: "tag1"),
    TagEntity(id: 2, name: "tag2"),
  },
);

void main() {
  group("Recipes Bloc", () {
    final recipesUsecase = MockRecipesUsecase();
    final deleteRecipesUsecase = MockDeleteRecipesUsecase();
    late RecipesBloc bloc;

    setUp(() {
      locator.registerSingleton<RecipesUsecase>(recipesUsecase);
      locator.registerSingleton<DeleteRecipesUsecase>(deleteRecipesUsecase);
      bloc = RecipesBloc();
    });

    tearDown(() {
      locator.unregister<RecipesUsecase>();
      locator.unregister<DeleteRecipesUsecase>();
      reset(recipesUsecase);
      reset(deleteRecipesUsecase);
      bloc.close();
    });

    test("load event is handled correctly", () async {
      when(() => recipesUsecase("", SortEntity.none, const FilterEntity())).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 5),
          () => Success(MockRecipes.all.map(RecipeEntity.fromModel).toList()),
        ),
      );

      expect(bloc.state, RecipesState.initial());

      bloc.add(const RecipesEventLoad());
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial().copyWith(status: RecipesStatus.loading));

      await awaitMs(10);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          status: RecipesStatus.success,
          recipes: MockRecipes.all.map(RecipeEntity.fromModel).map(RecipeCardDetails.fromEntity).toList(),
        ),
      );
    });

    test("load event is handled correctly with empty recipes", () async {
      when(() => recipesUsecase("", SortEntity.none, const FilterEntity())).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 5),
          () => Success([]),
        ),
      );

      expect(bloc.state, RecipesState.initial());

      bloc.add(const RecipesEventLoad());
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial().copyWith(status: RecipesStatus.loading));

      await awaitMs(10);
      expect(bloc.state, RecipesState.initial().copyWith(status: RecipesStatus.empty, recipes: const []));
    });

    test("load event is handled correctly with failure", () async {
      when(() => recipesUsecase("", SortEntity.none, const FilterEntity())).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 5),
          () => Failure(ErrorModel(ErrorCode.repository_recipe_getRecipesFailed)),
        ),
      );

      expect(bloc.state, RecipesState.initial());

      bloc.add(const RecipesEventLoad());
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial().copyWith(status: RecipesStatus.loading));

      await awaitMs(10);
      expect(bloc.state, RecipesState.initial().copyWith(status: RecipesStatus.error));
    });

    test("search event is handled correctly", () async {
      when(() => recipesUsecase("test", SortEntity.none, const FilterEntity())).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 5),
          () => Success(MockRecipes.all.map(RecipeEntity.fromModel).toList()),
        ),
      );

      expect(bloc.state, RecipesState.initial());

      bloc.add(const RecipesEventSearch(searchQuery: "test"));
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial().copyWith(status: RecipesStatus.loading, searchQuery: "test"));

      await awaitMs(10);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          status: RecipesStatus.success,
          searchQuery: "test",
          recipes: MockRecipes.all.map(RecipeEntity.fromModel).map(RecipeCardDetails.fromEntity).toList(),
        ),
      );
    });

    test("filter reset event is handled correctly", () async {
      expect(bloc.state, RecipesState.initial());

      bloc.add(RecipesEventUpdateSort(sort: SortEntity.recentlyViewed));
      bloc.add(RecipesEventUpdateRatingMin(ratingMin: 1));
      bloc.add(RecipesEventUpdateTime(timeMin: 2, timeMax: 3));
      bloc.add(RecipesEventUpdateServings(servingsMin: 4, servingsMax: 5));
      bloc.add(RecipesEventUpdateDifficulty(difficulties: {DifficultyEntity.easy, DifficultyEntity.medium}));
      bloc.add(
        RecipesEventUpdateTags(
          tags: {
            TagEntity(id: 1, name: "tag1"),
            TagEntity(id: 2, name: "tag2"),
          },
        ),
      );
      await awaitMs(1);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          sort: SortEntity.recentlyViewed,
          filter: _filterEntity,
        ),
      );

      bloc.add(const RecipesEventResetFilter());
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial());
    });

    test("toggles and resets selected ids", () async {
      expect(bloc.state, RecipesState.initial());

      bloc.add(const RecipesEventToggleSelected(recipeId: "1"));
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial().copyWith(selectedIds: {"1"}));

      bloc.add(const RecipesEventToggleSelected(recipeId: "2"));
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial().copyWith(selectedIds: {"1", "2"}));

      bloc.add(const RecipesEventToggleSelected(recipeId: "2"));
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial().copyWith(selectedIds: {"1"}));

      bloc.add(const RecipesEventResetSelected());
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial());
    });

    test("deletes selected recipes successfully", () async {
      when(() => recipesUsecase("", SortEntity.none, const FilterEntity())).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 5),
          () => Success(MockRecipes.all.map(RecipeEntity.fromModel).toList()),
        ),
      );

      when(() => deleteRecipesUsecase(["1", "2", "3"])).thenAnswer(
        (_) => Future.delayed(const Duration(milliseconds: 5), () => Success(None())),
      );

      expect(bloc.state, RecipesState.initial());

      bloc.add(const RecipesEventLoad());
      await awaitMs(15);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          status: RecipesStatus.success,
          recipes: MockRecipes.all.map(RecipeEntity.fromModel).map(RecipeCardDetails.fromEntity).toList(),
        ),
      );

      bloc.add(const RecipesEventToggleSelected(recipeId: "1"));
      bloc.add(const RecipesEventToggleSelected(recipeId: "2"));
      bloc.add(const RecipesEventToggleSelected(recipeId: "3"));
      await awaitMs(1);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          status: RecipesStatus.success,
          selectedIds: {"1", "2", "3"},
          recipes: MockRecipes.all.map(RecipeEntity.fromModel).map(RecipeCardDetails.fromEntity).toList(),
        ),
      );

      bloc.add(const RecipesEventDeleteSelected());
      await awaitMs(1);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          status: RecipesStatus.success,
          selectedIds: {"1", "2", "3"},
          recipes: MockRecipes.all.map(RecipeEntity.fromModel).map(RecipeCardDetails.fromEntity).toList(),
          isDeleting: true,
        ),
      );

      await awaitMs(10);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          status: RecipesStatus.success,
          selectedIds: {},
          recipes: const [],
        ),
      );
    });

    test("deletes selected recipes with failure", () async {
      when(() => recipesUsecase("", SortEntity.none, const FilterEntity())).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 5),
          () => Success(MockRecipes.all.map(RecipeEntity.fromModel).toList()),
        ),
      );

      when(() => deleteRecipesUsecase(["1", "2", "3"])).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 5),
          () => Failure(ErrorModel(ErrorCode.repository_recipe_deleteRecipesFailed)),
        ),
      );

      expect(bloc.state, RecipesState.initial());

      bloc.add(const RecipesEventLoad());
      await awaitMs(15);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          status: RecipesStatus.success,
          recipes: MockRecipes.all.map(RecipeEntity.fromModel).map(RecipeCardDetails.fromEntity).toList(),
        ),
      );

      bloc.add(const RecipesEventToggleSelected(recipeId: "1"));
      bloc.add(const RecipesEventToggleSelected(recipeId: "2"));
      bloc.add(const RecipesEventToggleSelected(recipeId: "3"));
      await awaitMs(1);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          status: RecipesStatus.success,
          selectedIds: {"1", "2", "3"},
          recipes: MockRecipes.all.map(RecipeEntity.fromModel).map(RecipeCardDetails.fromEntity).toList(),
        ),
      );

      bloc.add(const RecipesEventDeleteSelected());
      await awaitMs(1);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          status: RecipesStatus.success,
          selectedIds: {"1", "2", "3"},
          recipes: MockRecipes.all.map(RecipeEntity.fromModel).map(RecipeCardDetails.fromEntity).toList(),
          isDeleting: true,
        ),
      );

      await awaitMs(10);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          status: RecipesStatus.success,
          selectedIds: {"1", "2", "3"},
          recipes: MockRecipes.all.map(RecipeEntity.fromModel).map(RecipeCardDetails.fromEntity).toList(),
          error: ErrorCode.repository_recipe_deleteRecipesFailed,
        ),
      );
    });
  });
}
