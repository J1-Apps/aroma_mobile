import "package:aroma_mobile/data/model/filter_model.dart";
import "package:aroma_mobile/data/model/sort_model.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/supabase_remote_recipe_source.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Supabase Remote Recipe Source", () {
    late SupabaseRemoteRecipeSource source;

    setUp(() {
      source = SupabaseRemoteRecipeSource();
    });

    test("gets recipes", () async {
      final recipes = await source.getRecipes("", SortModel.none, const FilterModel());
      expect(recipes, const []);
    });

    test("deletes recipes", () async {
      final recipes = await source.getRecipes("", SortModel.none, const FilterModel());
      expect(recipes, const []);

      await source.deleteRecipes(recipes.map((recipe) => recipe.id).toList());
      final recipes2 = await source.getRecipes("", SortModel.none, const FilterModel());
      expect(recipes2, const []);
    });
  });
}
