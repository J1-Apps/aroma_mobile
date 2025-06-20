import "dart:async";

import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:aroma_mobile/domain/usecase/tag/tag_usecase.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/filter_drawer.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../../test_util/test_wrapper.dart";
import "../../../../../test_util/testing_mocks.dart";

void main() {
  group("Filter Drawer", () {
    final router = MockRouter();
    final RecipesBloc bloc = MockRecipesBloc();
    final TagUsecase tagUsecase = MockTagUsecase();
    late StreamController<RecipesState> stream;

    setUpAll(() {
      registerFallbackValue(FakeBuildContext());
    });

    setUp(() {
      locator.registerSingleton<J1Router>(router);
      locator.registerSingleton<TagUsecase>(tagUsecase);

      when(() => router.pop(any())).thenAnswer((_) => Future.value());

      stream = StreamController<RecipesState>.broadcast();
      when(bloc.close).thenAnswer((_) => Future.value());
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
      locator.unregister<J1Router>();
      locator.unregister<TagUsecase>();

      reset(router);
      reset(bloc);
      reset(tagUsecase);
      stream.close();
    });

    testWidgets("updates and resets filters", (tester) async {
      tester.view.physicalSize = const Size(720, 2000);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(TestWrapper(child: FilterDrawer(bloc: bloc)));

      await tester.tap(find.text("Recently viewed"));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Easy"));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Reset"));
      await tester.pumpAndSettle();

      // verify(() => bloc.add(RecipesEventFilter(sort: SortEntity.none, filter: FilterEntity()))).called(1);
    });

    testWidgets("updates and saves filters", (tester) async {
      tester.view.physicalSize = const Size(720, 2000);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(TestWrapper(child: FilterDrawer(bloc: bloc)));

      await tester.tap(find.text("Recently viewed"));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(JamIcons.star).at(3));
      await tester.pumpAndSettle();

      final timeBox = tester.getRect(find.byType(RangeSlider).first);

      await tester.dragFrom(Offset(timeBox.left + 20, timeBox.top), const Offset(100, 0));
      await tester.pumpAndSettle();

      await tester.dragFrom(Offset(timeBox.right - 20, timeBox.top), const Offset(-100, 0));
      await tester.pumpAndSettle();

      final servingsBox = tester.getRect(find.byType(RangeSlider).last);

      await tester.dragFrom(Offset(servingsBox.left + 20, servingsBox.top), const Offset(100, 0));
      await tester.pumpAndSettle();

      await tester.dragFrom(Offset(servingsBox.right - 20, servingsBox.top), const Offset(-100, 0));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Easy"));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Apply"));
      await tester.pumpAndSettle();

      // verify(
      //   () => bloc.add(
      //     RecipesEventFilter(
      //       sort: SortEntity.recentlyViewed,
      //       filter: FilterEntity(
      //         ratingMin: 8,
      //         timeMin: 20,
      //         timeMax: 100,
      //         servingsMin: 3,
      //         servingsMax: 17,
      //         difficulties: {DifficultyEntity.easy},
      //       ),
      //     ),
      //   ),
      // ).called(1);
    });

    testWidgets("updates and saves tag filters", (tester) async {
      tester.view.physicalSize = const Size(720, 2000);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(TestWrapper(child: FilterDrawer(bloc: bloc)));

      when(
        () => tagUsecase.call(
          query: any(named: "query"),
          limit: any(named: "limit"),
        ),
      ).thenAnswer(
        (_) => Future.value(const [TagEntity(id: 1, name: "test1"), TagEntity(id: 2, name: "test2")]),
      );

      when(
        () => tagUsecase.call(
          query: any(named: "query", that: equals("test2")),
          limit: any(named: "limit"),
        ),
      ).thenAnswer(
        (_) => Future.delayed(const Duration(milliseconds: 100), () => const [TagEntity(id: 2, name: "test2")]),
      );

      await tester.tap(find.byType(DropdownMenu<TagEntity>));
      await tester.pumpAndSettle();

      expect(find.text("test1"), findsOneWidget);
      expect(find.text("test2"), findsOneWidget);

      await tester.tap(find.text("test1"));
      await tester.pumpAndSettle();

      expect(find.text("test1"), findsOneWidget);
      expect(find.text("test2"), findsNothing);

      await tester.enterText(find.byType(TextField), "test2");
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(JLoadingIndicator), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text("test1"), findsOneWidget);
      expect(find.text("test2"), findsNWidgets(2));

      await tester.tap(find.text("test2").last);
      await tester.pumpAndSettle();

      expect(find.text("test1"), findsOneWidget);
      expect(find.text("test2"), findsOneWidget);

      await tester.tap(find.text("test2"));
      await tester.pumpAndSettle();

      expect(find.text("test1"), findsOneWidget);
      expect(find.text("test2"), findsNothing);

      await tester.tap(find.text("Apply"));
      await tester.pumpAndSettle();

      // verify(
      //   () => bloc.add(
      //     RecipesEventFilter(
      //       sort: SortEntity.none,
      //       filter: FilterEntity(tags: {TagEntity(id: 1, name: "test1")}),
      //     ),
      //   ),
      // ).called(1);
    });
  });
}
