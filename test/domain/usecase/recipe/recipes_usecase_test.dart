import "package:aroma_mobile/data/source/util/memory_data.dart";
import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/recipe_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/domain/repository/recipe_repository.dart";
import "package:aroma_mobile/domain/usecase/recipe/recipes_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_environment/j1_environment.dart";
import "package:j1_core_base/j1_result/j1_result.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Recipes Usecase", () {
    final recipeRepository = MockRecipeRepository();
    late RecipesUsecase recipesUsecase;

    setUp(() {
      locator.registerSingleton<RecipeRepository>(recipeRepository);
      recipesUsecase = RecipesUsecaseImpl();
    });

    tearDown(() {
      locator.unregister<RecipeRepository>();
      reset(recipeRepository);
    });

    test("calls repository", () async {
      when(() => recipeRepository.getRecipes("chicken", SortEntity.none, const FilterEntity())).thenAnswer(
        (_) async => Success(MockRecipes.all.map(RecipeEntity.fromModel).toList()),
      );
      final result = await recipesUsecase.call("chicken", SortEntity.none, const FilterEntity());
      expect(result, Success(MockRecipes.all.map(RecipeEntity.fromModel).toList()));
      verify(() => recipeRepository.getRecipes("chicken", SortEntity.none, const FilterEntity())).called(1);
    });
  });
}
