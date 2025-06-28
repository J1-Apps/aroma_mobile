import "package:aroma_mobile/domain/repository/recipe_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class DeleteRecipesUsecase {
  Future<Result<None>> call(List<String> ids);
}

class DeleteRecipesUsecaseImpl implements DeleteRecipesUsecase {
  final RecipeRepository _recipeRepository;

  DeleteRecipesUsecaseImpl({
    RecipeRepository? recipeRepository,
  }) : _recipeRepository = recipeRepository ?? locator.get<RecipeRepository>();

  @override
  Future<Result<None>> call(List<String> ids) => _recipeRepository.deleteRecipes(ids);
}
