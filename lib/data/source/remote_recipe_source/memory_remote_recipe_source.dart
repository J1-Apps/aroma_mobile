import "package:aroma_mobile/data/model/filter_model.dart";
import "package:aroma_mobile/data/model/recipe_model.dart";
import "package:aroma_mobile/data/model/sort_model.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/remote_recipe_source.dart";
import "package:aroma_mobile/data/source/util/memory_source.dart";

class MemoryRemoteRecipeSource extends MemorySource implements RemoteRecipeSource {
  MemoryRemoteRecipeSource({
    super.initialShouldThrow,
    super.initialMsDelay,
  });

  @override
  Future<List<RecipeModel>> getRecipes(SortModel sort, FilterModel filter) async {
    return [];
  }
}
