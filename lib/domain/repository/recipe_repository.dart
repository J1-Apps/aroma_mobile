import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/remote_recipe_source.dart";
import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/recipe_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class RecipeRepository {
  Future<Result<List<RecipeEntity>>> getRecipes(String searchQuery, SortEntity sort, FilterEntity filter);
  Future<Result<None>> deleteRecipes(List<String> ids);
}

class RecipeRepositoryImpl implements RecipeRepository {
  final RemoteRecipeSource _remoteRecipeSource;

  RecipeRepositoryImpl({
    RemoteRecipeSource? remoteRecipeSource,
  }) : _remoteRecipeSource = remoteRecipeSource ?? locator.get<RemoteRecipeSource>();

  @override
  Future<Result<List<RecipeEntity>>> getRecipes(String searchQuery, SortEntity sort, FilterEntity filter) async {
    try {
      final recipes = await _remoteRecipeSource.getRecipes(searchQuery, sort.toModel(), filter.toModel());
      return Success(recipes.map(RecipeEntity.fromModel).toList());
    } catch (e) {
      return Failure(ErrorModel(ErrorCode.repository_recipe_getRecipesFailed, message: e.toString()));
    }
  }

  @override
  Future<Result<None>> deleteRecipes(List<String> ids) async {
    try {
      await _remoteRecipeSource.deleteRecipes(ids);
      return const Success(None());
    } catch (e) {
      return Failure(ErrorModel(ErrorCode.repository_recipe_deleteRecipesFailed, message: e.toString()));
    }
  }
}
