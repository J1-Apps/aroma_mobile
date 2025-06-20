import "package:aroma_mobile/data/model/filter_model.dart";
import "package:aroma_mobile/data/model/recipe_model.dart";
import "package:aroma_mobile/data/model/sort_model.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/remote_recipe_source.dart";

class SupabaseRemoteRecipeSource extends RemoteRecipeSource {
  SupabaseRemoteRecipeSource();

  @override
  Future<List<RecipeModel>> getRecipes(SortModel sort, FilterModel filter) async {
    return [];
  }
}
