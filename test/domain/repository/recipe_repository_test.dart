import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/model/filter_model.dart";
import "package:aroma_mobile/data/model/sort_model.dart";
import "package:aroma_mobile/data/source/remote_recipe_source/remote_recipe_source.dart";
import "package:aroma_mobile/data/source/util/memory_data.dart";
import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/recipe_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/domain/repository/recipe_repository.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../test_util/testing_mocks.dart";

void main() {
  group("Recipe Repository", () {
    final remoteSource = MockRemoteRecipeSource();
    late RecipeRepository repository;

    setUp(() {
      locator.registerSingleton<RemoteRecipeSource>(remoteSource);
      repository = RecipeRepositoryImpl();
    });

    tearDown(() {
      locator.reset();
      reset(remoteSource);
    });

    test("returns success when remote source succeeds", () async {
      when(() => remoteSource.getRecipes("chicken", SortModel.none, const FilterModel())).thenAnswer(
        (_) async => MockRecipes.all,
      );

      final result = await repository.getRecipes("chicken", SortEntity.none, const FilterEntity());

      expect(result, Success(MockRecipes.all.map(RecipeEntity.fromModel).toList()));
      verify(() => remoteSource.getRecipes("chicken", SortModel.none, const FilterModel())).called(1);
    });

    test("returns failure when remote source fails", () async {
      when(() => remoteSource.getRecipes("chicken", SortModel.none, const FilterModel())).thenThrow(
        ErrorModel(ErrorCode.source_remote_recipe_getRecipesFailed),
      );

      final result = await repository.getRecipes("chicken", SortEntity.none, const FilterEntity());

      expect(
        result,
        Failure<List<RecipeEntity>, Exception>(
          ErrorModel(
            ErrorCode.repository_recipe_getRecipesFailed,
            message: "ErrorModel(code: ErrorCode.source_remote_recipe_getRecipesFailed, message: )",
          ),
        ),
      );
      verify(() => remoteSource.getRecipes("chicken", SortModel.none, const FilterModel())).called(1);
    });

    test("returns success when remote source delete recipes succeeds", () async {
      when(() => remoteSource.deleteRecipes(["1", "2", "3"])).thenAnswer((_) async => const Success(0));

      final result = await repository.deleteRecipes(["1", "2", "3"]);
      expect(result, const Success(None()));
      verify(() => remoteSource.deleteRecipes(["1", "2", "3"])).called(1);
    });

    test("returns failure when remote source delete recipes fails", () async {
      when(() => remoteSource.deleteRecipes(["1", "2", "3"])).thenThrow(
        ErrorModel(ErrorCode.source_remote_recipe_deleteRecipesFailed),
      );

      final result = await repository.deleteRecipes(["1", "2", "3"]);
      expect(
        result,
        Failure<None, Exception>(
          ErrorModel(
            ErrorCode.repository_recipe_deleteRecipesFailed,
            message: "ErrorModel(code: ErrorCode.source_remote_recipe_deleteRecipesFailed, message: )",
          ),
        ),
      );
      verify(() => remoteSource.deleteRecipes(["1", "2", "3"])).called(1);
    });
  });
}
