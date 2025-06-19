import "dart:async";

import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_search.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../../test_util/test_wrapper.dart";
import "../../../../../test_util/testing_mocks.dart";

void main() {
  group("Recipes Search", () {
    final RecipesBloc bloc = MockRecipesBloc();
    late StreamController<RecipesState> stream;

    setUp(() {
      stream = StreamController<RecipesState>.broadcast();
      when(bloc.close).thenAnswer((_) => Future.value());
      when(() => bloc.state).thenReturn(RecipesState.initial());
      when(() => bloc.stream).thenAnswer((_) => stream.stream);
    });

    tearDown(() {
      reset(bloc);
      stream.close();
    });

    testWidgets("handles search submit", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const RecipesSearch()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(JTextField), "test");
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      verify(() => bloc.add(RecipesEventSearch(searchQuery: "test"))).called(1);
    });

    testWidgets("handles search icon press", (tester) async {
      await tester.pumpWidget(TestWrapper(globalBloc: bloc, child: const RecipesSearch()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(JTextField), "test");
      await tester.tap(find.byIcon(JamIcons.search));
      await tester.pumpAndSettle();

      verify(() => bloc.add(RecipesEventSearch(searchQuery: "test"))).called(1);
    });
  });
}
