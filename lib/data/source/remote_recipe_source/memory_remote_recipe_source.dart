import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/model/filter_model.dart";
import "package:aroma_mobile/data/model/recipe_model.dart";
import "package:aroma_mobile/data/model/sort_model.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/remote_recipe_source.dart";
import "package:aroma_mobile/data/source/util/memory_data.dart";
import "package:aroma_mobile/data/source/util/memory_source.dart";
import "package:collection/collection.dart";

class MemoryRemoteRecipeSource extends MemorySource implements RemoteRecipeSource {
  MemoryRemoteRecipeSource({
    super.initialShouldThrow,
    super.initialMsDelay,
  });

  @override
  Future<List<RecipeModel>> getRecipes(SortModel sort, FilterModel filter) async {
    return wrapRequest(
      Future.sync(() {
        final filtered = filter.isEmpty
            ? _memoryRecipes
            : _memoryRecipes.where((recipe) {
                final totalTime = recipe.prepTime + recipe.cookTime;

                return (filter.ratingMin == null || recipe.rating >= filter.ratingMin!) &&
                    (filter.timeMin == null || totalTime >= filter.timeMin!) &&
                    (filter.timeMax == null || totalTime <= filter.timeMax!) &&
                    (filter.servingsMin == null || recipe.servings >= filter.servingsMin!) &&
                    (filter.servingsMax == null || recipe.servings <= filter.servingsMax!) &&
                    (filter.difficulties.isEmpty || filter.difficulties.contains(recipe.difficulty)) &&
                    (filter.tags.isEmpty || recipe.tags.any((tag) => filter.tags.contains(tag.id)));
              });

        return switch (sort) {
          SortModel.none => filtered,
          SortModel.recentlyViewed => filtered,
          SortModel.rating => filtered.sortedBy((recipe) => recipe.rating),
          SortModel.quickest => filtered.sortedBy((recipe) => recipe.prepTime + recipe.cookTime),
          SortModel.easiest => filtered.sortedBy((recipe) => recipe.difficulty),
          SortModel.alphabetical => filtered.sortedBy((recipe) => recipe.title),
        }.toList();
      }),
      ErrorCode.source_remote_recipe_getRecipesFailed,
    );
  }
}

const _memoryRecipes = [
  MockRecipes.tebaShio,
  MockRecipes.thaiRedCurry,
  MockRecipes.oiMuchin,
];
