import "package:aroma_mobile/data/model/filter_model.dart";
import "package:aroma_mobile/data/model/sort_model.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/memory_remote_recipe_source.dart";
import "package:aroma_mobile/data/source/util/memory_data.dart";
import "package:collection/collection.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Memory Remote Recipe Source", () {
    late MemoryRemoteRecipeSource source;

    setUp(() {
      source = MemoryRemoteRecipeSource(initialMsDelay: 1);
    });

    test("gets recipes with empty filter", () async {
      final recipes = await source.getRecipes("", SortModel.none, const FilterModel());
      expect(recipes, MockRecipes.all);
    });

    test("gets recipes with populated filter", () async {
      final filter = FilterModel(tags: {1});
      final recipes = await source.getRecipes("", SortModel.none, filter);
      expect(
        recipes,
        MockRecipes.all.where((recipe) => recipe.tags.any((tag) => tag.id == 1)).toList(),
      );
    });

    test("gets recipes with populated search query", () async {
      final recipes = await source.getRecipes("chicken", SortModel.none, const FilterModel());
      expect(
        recipes,
        MockRecipes.all
            .where(
              (recipe) =>
                  recipe.title.toLowerCase().contains("chicken") ||
                  recipe.descriptionRaw.toLowerCase().contains("chicken") ||
                  recipe.ingredientsRaw.toLowerCase().contains("chicken") ||
                  recipe.directionsRaw.toLowerCase().contains("chicken") ||
                  recipe.notesRaw.toLowerCase().contains("chicken"),
            )
            .toList(),
      );
    });

    test("gets recipes sorted by none", () async {
      final recipes = await source.getRecipes("", SortModel.none, const FilterModel());
      expect(recipes, MockRecipes.all.toList());
    });

    test("gets recipes sorted by recently viewed", () async {
      final recipes = await source.getRecipes("", SortModel.recentlyViewed, const FilterModel());
      expect(recipes, MockRecipes.all.toList());
    });

    test("gets recipes sorted by rating", () async {
      final recipes = await source.getRecipes("", SortModel.rating, const FilterModel());
      expect(recipes, MockRecipes.all.sortedBy((recipe) => -recipe.rating).toList());
    });

    test("gets recipes sorted by quickest", () async {
      final recipes = await source.getRecipes("", SortModel.quickest, const FilterModel());
      expect(recipes, MockRecipes.all.sortedBy((recipe) => recipe.prepTime + recipe.cookTime).toList());
    });

    test("gets recipes sorted by easiest", () async {
      final recipes = await source.getRecipes("", SortModel.easiest, const FilterModel());
      expect(recipes, MockRecipes.all.sortedBy((recipe) => recipe.difficulty).toList());
    });

    test("gets recipes sorted by alphabetical", () async {
      final recipes = await source.getRecipes("", SortModel.alphabetical, const FilterModel());
      expect(recipes, MockRecipes.all.sortedBy((recipe) => recipe.title).toList());
    });
  });
}
