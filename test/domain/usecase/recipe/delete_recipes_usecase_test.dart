import "package:aroma_mobile/domain/repository/recipe_repository.dart";
import "package:aroma_mobile/domain/usecase/recipe/delete_recipes_usecase.dart";
import "package:aroma_mobile/util/none.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Delete Recipes Usecase", () {
    final recipeRepository = MockRecipeRepository();
    late DeleteRecipesUsecase usecase;

    setUp(() {
      locator.registerSingleton<RecipeRepository>(recipeRepository);
      usecase = DeleteRecipesUsecaseImpl();
    });

    tearDown(() {
      locator.unregister<RecipeRepository>();
      reset(recipeRepository);
    });

    test("calls repository", () async {
      when(() => recipeRepository.deleteRecipes(["1", "2", "3"])).thenAnswer((_) async => const Success(None()));

      final result = await usecase.call(["1", "2", "3"]);
      expect(result, const Success(None()));
      verify(() => recipeRepository.deleteRecipes(["1", "2", "3"])).called(1);
    });
  });
}
