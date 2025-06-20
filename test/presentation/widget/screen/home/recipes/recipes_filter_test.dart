import "dart:async";

import "package:aroma_mobile/domain/entity/difficulty_entity.dart";
import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:aroma_mobile/domain/usecase/tag/tag_usecase.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/filter_drawer.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_filter.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../../test_util/test_wrapper.dart";
import "../../../../../test_util/testing_mocks.dart";

void main() {
  group("Recipes Filter", () {
    final RecipesBloc bloc = MockRecipesBloc();
    final TagUsecase tagUsecase = MockTagUsecase();
    late StreamController<RecipesState> stream;

    setUp(() {
      locator.registerSingleton<TagUsecase>(tagUsecase);

      stream = StreamController<RecipesState>.broadcast();
      when(bloc.close).thenAnswer((_) => Future.value());
      when(() => bloc.isClosed).thenReturn(false);
      when(() => bloc.state).thenReturn(RecipesState.initial());
      when(() => bloc.stream).thenAnswer((_) => stream.stream);
      when(
        () => tagUsecase.call(
          query: any(named: "query"),
          limit: any(named: "limit"),
        ),
      ).thenAnswer(
        (_) => Future.value(const [TagEntity(id: 1, name: "test")]),
      );
    });

    tearDown(() {
      locator.unregister<TagUsecase>();

      reset(bloc);
      reset(tagUsecase);
      stream.close();
    });

    testWidgets("shows filter drawer", (tester) async {
      tester.view.physicalSize = const Size(720, 2000);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const RecipesFilter(),
        ),
      );

      await tester.tap(find.byType(JCard));
      await tester.pumpAndSettle();

      expect(find.byType(FilterDrawer), findsOneWidget);

      await tester.tap(find.text("Recently viewed"));
      await tester.pumpAndSettle();

      when(() => bloc.state).thenReturn(RecipesState.initial().copyWith(sort: SortEntity.recentlyViewed));

      final rect = tester.getRect(find.byType(FilterDrawer));

      await tester.tapAt(Offset(rect.left + rect.width / 2, rect.top - 100));
      await tester.pumpAndSettle();

      verify(() => bloc.add(const RecipesEventLoad())).called(1);

      await tester.tap(find.byType(JCard));
      await tester.pumpAndSettle();

      expect(find.byType(FilterDrawer), findsOneWidget);

      await tester.tapAt(Offset(rect.left + rect.width / 2, rect.top - 100));
      await tester.pumpAndSettle();

      verifyNever(() => bloc.add(const RecipesEventLoad()));
    });

    testWidgets("shows relevant min/max filters", (tester) async {
      when(() => bloc.state).thenReturn(
        RecipesState.initial().copyWith(
          sort: SortEntity.recentlyViewed,
          filter: FilterEntity(
            timeMin: 10,
            timeMax: 20,
            ratingMin: 1,
            servingsMin: 1,
            servingsMax: 2,
            difficulties: {DifficultyEntity.easy},
            tags: {TagEntity(id: 1, name: "test")},
          ),
        ),
      );

      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const RecipesFilter()));

      expect(find.text("Recently viewed"), findsOneWidget);
      expect(find.text("Time > 10m"), findsOneWidget);
      expect(find.text("Time < 20m"), findsOneWidget);
      expect(find.text("Rating > 0.5"), findsOneWidget);
      expect(find.text("Servings > 1"), findsOneWidget);
      expect(find.text("Servings < 2"), findsOneWidget);
      expect(find.text("Easy"), findsOneWidget);
      expect(find.text("test"), findsOneWidget);
    });

    testWidgets("shows relevant equal filters", (tester) async {
      when(() => bloc.state).thenReturn(
        RecipesState.initial().copyWith(
          sort: SortEntity.recentlyViewed,
          filter: FilterEntity(timeMin: 10, timeMax: 10, servingsMin: 1, servingsMax: 1),
        ),
      );

      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const RecipesFilter()));

      expect(find.text("Recently viewed"), findsOneWidget);
      expect(find.text("Time = 10m"), findsOneWidget);
      expect(find.text("Servings = 1"), findsOneWidget);
    });
  });
}
