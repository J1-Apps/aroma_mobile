import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/home/home_scaffold.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../test_util/test_wrapper.dart";
import "../../../../test_util/testing_mocks.dart";

void main() {
  group("Home Scaffold", () {
    final router = MockRouter();

    setUpAll(() {
      registerFallbackValue(FakeBuildContext());
      registerFallbackValue(FakeEmptyRoute());
      registerFallbackValue(const EmptyRouteConfig());
    });

    setUp(() {
      when(() => router.push<EmptyRouteConfig>(any(), any(), any())).thenAnswer((_) => Future.value());
      locator.registerSingleton<J1Router>(router);
    });

    tearDown(() {
      locator.unregister<J1Router>();
      reset(router);
    });

    testWidgets("navigates to settings", (tester) async {
      await tester.pumpWidget(
        TestWrapper(
          child: HomeScaffold(
            currentIndex: 0,
            updateIndex: (index) {},
            body: const Center(child: Text("Body")),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(JamIcons.settings));
      await tester.pumpAndSettle();

      verify(() => router.push<EmptyRouteConfig>(any(), AromaRoute.settings, const EmptyRouteConfig())).called(1);
    });

    testWidgets("displays a navigation bar, and calls the correct shell callbacks", (tester) async {
      final updateIndex = MockCallback<int>();

      await tester.pumpWidget(
        TestWrapper(
          child: HomeScaffold(
            currentIndex: 0,
            updateIndex: updateIndex.call,
            body: const Center(child: Text("Body")),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Body"), findsOneWidget);
      expect(find.byIcon(JamIcons.unorderedlist), findsOneWidget);
      expect(find.byIcon(JamIcons.book), findsOneWidget);
      expect(find.byIcon(JamIcons.account), findsOneWidget);

      await tester.tap(find.byIcon(JamIcons.unorderedlist));
      await tester.pumpAndSettle();
      verify(() => updateIndex(0)).called(1);

      await tester.tap(find.byIcon(JamIcons.book));
      await tester.pumpAndSettle();
      verify(() => updateIndex(1)).called(1);

      await tester.tap(find.byIcon(JamIcons.account));
      await tester.pumpAndSettle();
      verify(() => updateIndex(2)).called(1);
    });
  });
}
