import "dart:async";

import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_app_bar.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../../test_util/test_wrapper.dart";
import "../../../../../test_util/testing_mocks.dart";

void main() {
  group("Recipes App Bar", () {
    final router = MockRouter();
    final RecipesBloc bloc = MockRecipesBloc();
    final BuildContext context = FakeBuildContext();
    late StreamController<RecipesState> stream;

    setUpAll(() {
      registerFallbackValue(context);
    });

    setUp(() {
      stream = StreamController<RecipesState>.broadcast();
      locator.registerSingleton<J1Router>(router);
      when(() => router.pop(any(), any())).thenAnswer((_) => Future.value());
      when(bloc.close).thenAnswer((_) => Future.value());
      when(() => bloc.state).thenReturn(RecipesState.initial());
      when(() => bloc.stream).thenAnswer((_) => stream.stream);
    });

    tearDown(() {
      locator.unregister<J1Router>();
      reset(router);
      reset(bloc);
      stream.close();
    });

    testWidgets("handles selected state and canceling selection", (tester) async {
      when(() => bloc.state).thenReturn(RecipesState.initial().copyWith(selectedIds: {"1", "2"}));

      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const RecipesAppBar()));

      expect(find.text("Aroma"), findsNothing);
      expect(find.text("2"), findsOneWidget);

      await tester.tap(find.byType(JIconButton).last);
      await tester.pumpAndSettle();

      verify(() => bloc.add(RecipesEventResetSelected())).called(1);

      stream.add(RecipesState.initial().copyWith(selectedIds: {}));
      await tester.pumpAndSettle();

      expect(find.text("Aroma"), findsOneWidget);
      expect(find.text("2"), findsNothing);
    });

    testWidgets("handles deleting selected recipes", (tester) async {
      tester.view.physicalSize = const Size(720, 2000);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      when(() => bloc.state).thenReturn(RecipesState.initial().copyWith(selectedIds: {"1", "2"}));

      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const RecipesAppBar()));

      expect(find.text("Aroma"), findsNothing);
      expect(find.text("2"), findsOneWidget);

      await tester.tap(find.byType(JIconButton).first);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.byType(JTextButton).last);
      await tester.pumpAndSettle();

      verify(() => bloc.add(RecipesEventDeleteSelected())).called(1);

      stream.add(RecipesState.initial().copyWith(selectedIds: {"1", "2"}, isDeleting: true));
      await tester.pump(const Duration(milliseconds: 1000));
      expect(find.byType(JLoadingIndicator), findsOneWidget);

      stream.add(RecipesState.initial().copyWith(selectedIds: {}, isDeleting: false));
      await tester.pumpAndSettle();

      verify(() => router.pop<Object?>(any(), any())).called(1);
    });

    testWidgets("handles cancelingdeleting selected recipes", (tester) async {
      tester.view.physicalSize = const Size(720, 2000);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      when(() => bloc.state).thenReturn(RecipesState.initial().copyWith(selectedIds: {"1", "2"}));

      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const RecipesAppBar()));

      expect(find.text("Aroma"), findsNothing);
      expect(find.text("2"), findsOneWidget);

      await tester.tap(find.byType(JIconButton).first);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.byType(JTextButton).first);
      await tester.pumpAndSettle();

      verify(() => router.pop<Object?>(any(), any())).called(1);
      verifyNever(() => bloc.add(RecipesEventDeleteSelected()));
    });
  });
}
