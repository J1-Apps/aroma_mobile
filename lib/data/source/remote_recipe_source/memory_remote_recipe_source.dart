import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/model/filter_model.dart";
import "package:aroma_mobile/data/model/recipe_model.dart";
import "package:aroma_mobile/data/model/sort_model.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/remote_recipe_source.dart";
import "package:aroma_mobile/data/source/util/memory_data.dart";
import "package:aroma_mobile/data/source/util/memory_source.dart";
import "package:aroma_mobile/util/string_extension.dart";
import "package:collection/collection.dart";

class MemoryRemoteRecipeSource extends MemorySource implements RemoteRecipeSource {
  MemoryRemoteRecipeSource({
    super.initialShouldThrow,
    super.initialMsDelay,
  });

  @override
  Future<List<RecipeModel>> getRecipes(String searchQuery, SortModel sort, FilterModel filter) async {
    return wrapRequest(
      Future.sync(() {
        final filtered = filter.isEmpty
            ? MockRecipes.all
            : MockRecipes.all.where((recipe) {
                final totalTime = recipe.prepTime + recipe.cookTime;

                return (filter.ratingMin == null || recipe.rating >= filter.ratingMin!) &&
                    (filter.timeMin == null || totalTime >= filter.timeMin!) &&
                    (filter.timeMax == null || totalTime <= filter.timeMax!) &&
                    (filter.servingsMin == null || recipe.servings >= filter.servingsMin!) &&
                    (filter.servingsMax == null || recipe.servings <= filter.servingsMax!) &&
                    (filter.difficulties.isEmpty || filter.difficulties.contains(recipe.difficulty)) &&
                    (filter.tags.isEmpty || recipe.tags.map((tag) => tag.id).toSet().containsAll(filter.tags));
              });

        final searched = searchQuery.isBlank
            ? filtered
            : filtered.where((recipe) {
                return recipe.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
                    recipe.descriptionRaw.toLowerCase().contains(searchQuery.toLowerCase()) ||
                    recipe.ingredientsRaw.toLowerCase().contains(searchQuery.toLowerCase()) ||
                    recipe.directionsRaw.toLowerCase().contains(searchQuery.toLowerCase()) ||
                    recipe.notesRaw.toLowerCase().contains(searchQuery.toLowerCase());
              }).toList();

        return switch (sort) {
          SortModel.none => searched,
          SortModel.recentlyViewed => searched,
          SortModel.rating => searched.sortedBy((recipe) => -recipe.rating),
          SortModel.quickest => searched.sortedBy((recipe) => recipe.prepTime + recipe.cookTime),
          SortModel.easiest => searched.sortedBy((recipe) => recipe.difficulty),
          SortModel.alphabetical => searched.sortedBy((recipe) => recipe.title),
        }.toList();
      }),
      ErrorCode.source_remote_recipe_getRecipesFailed,
    );
  }
}
