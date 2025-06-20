import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/recipe_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/domain/repository/recipe_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class RecipesUsecase {
  Future<Result<List<RecipeEntity>>> call(SortEntity sort, FilterEntity filter);
}

class RecipesUsecaseImpl implements RecipesUsecase {
  final RecipeRepository _recipeRepository;

  RecipesUsecaseImpl({RecipeRepository? recipeRepository})
    : _recipeRepository = recipeRepository ?? locator.get<RecipeRepository>();

  @override
  Future<Result<List<RecipeEntity>>> call(SortEntity sort, FilterEntity filter) =>
      _recipeRepository.getRecipes(sort, filter);
}
