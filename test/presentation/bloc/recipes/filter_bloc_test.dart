import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:aroma_mobile/domain/usecase/tag/tags_usecase.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_state.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";
import "../../../test_util/testing_utils.dart";

void main() {
  group("Filter Bloc", () {
    final tagsUsecase = MockTagsUsecase();
    late FilterDrawerBloc bloc;

    setUp(() {
      locator.registerSingleton<TagsUsecase>(tagsUsecase);
      bloc = FilterDrawerBloc();
    });

    tearDown(() {
      locator.unregister<TagsUsecase>();
      reset(tagsUsecase);
      bloc.close();
    });

    test("handles tag query changed", () async {
      when(() => tagsUsecase(query: "test")).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 50),
          () => [TagEntity(id: 1, name: "test")],
        ),
      );

      bloc.add(const FilterDrawerEventTagQueryChanged(tagQuery: "test"));
      await awaitMs(260);
      expect(bloc.state, FilterDrawerState.initial().copyWith(tagStatus: TagStatus.loading, tagResults: []));

      await awaitMs(50);
      expect(
        bloc.state,
        FilterDrawerState.initial().copyWith(
          tagStatus: TagStatus.success,
          tagResults: [TagEntity(id: 1, name: "test")],
        ),
      );
    });
  });
}
