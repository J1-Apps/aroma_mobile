import "package:aroma_mobile/data/model/filter_model.dart";
import "package:aroma_mobile/data/model/recipe_model.dart";
import "package:aroma_mobile/data/model/sort_model.dart";

abstract class RemoteRecipeSource {
  Future<List<RecipeModel>> getRecipes(SortModel sort, FilterModel filter);
}
