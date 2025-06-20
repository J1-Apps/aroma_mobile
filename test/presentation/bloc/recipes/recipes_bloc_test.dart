import "package:aroma_mobile/domain/entity/difficulty_entity.dart";
import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:flutter_test/flutter_test.dart";

import "../../../test_util/testing_utils.dart";

final _filterEntity = FilterEntity(
  ratingMin: 1,
  timeMin: 2,
  timeMax: 3,
  servingsMin: 4,
  servingsMax: 5,
  difficulties: {DifficultyEntity.easy, DifficultyEntity.medium},
  tags: {
    TagEntity(id: 1, name: "tag1"),
    TagEntity(id: 2, name: "tag2"),
  },
);

// TODO: Update delay to not use one second once full use case is implemented.
void main() {
  group("Recipes Bloc", () {
    late RecipesBloc bloc;

    setUp(() {
      bloc = RecipesBloc();
    });

    tearDown(() {
      bloc.close();
    });

    test("load event is handled correctly", () async {
      expect(bloc.state, RecipesState.initial());

      bloc.add(const RecipesEventLoad());
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial().copyWith(status: RecipesStatus.loading));

      await awaitMs(1100);
      expect(bloc.state, RecipesState.initial().copyWith(status: RecipesStatus.success));
    });

    test("search event is handled correctly", () async {
      expect(bloc.state, RecipesState.initial());

      bloc.add(const RecipesEventSearch(searchQuery: "test"));
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial().copyWith(status: RecipesStatus.loading, searchQuery: "test"));

      await awaitMs(1100);
      expect(bloc.state, RecipesState.initial().copyWith(status: RecipesStatus.success, searchQuery: "test"));
    });

    test("filter reset event is handled correctly", () async {
      expect(bloc.state, RecipesState.initial());

      bloc.add(RecipesEventUpdateSort(sort: SortEntity.recentlyViewed));
      bloc.add(RecipesEventUpdateRatingMin(ratingMin: 1));
      bloc.add(RecipesEventUpdateTime(timeMin: 2, timeMax: 3));
      bloc.add(RecipesEventUpdateServings(servingsMin: 4, servingsMax: 5));
      bloc.add(RecipesEventUpdateDifficulty(difficulties: {DifficultyEntity.easy, DifficultyEntity.medium}));
      bloc.add(
        RecipesEventUpdateTags(
          tags: {
            TagEntity(id: 1, name: "tag1"),
            TagEntity(id: 2, name: "tag2"),
          },
        ),
      );
      await awaitMs(1);
      expect(
        bloc.state,
        RecipesState.initial().copyWith(
          sort: SortEntity.recentlyViewed,
          filter: _filterEntity,
        ),
      );

      bloc.add(const RecipesEventResetFilter());
      await awaitMs(1);
      expect(bloc.state, RecipesState.initial());
    });
  });
}
