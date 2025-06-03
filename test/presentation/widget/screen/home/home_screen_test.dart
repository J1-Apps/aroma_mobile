import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/home/home_screen.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../test_util/test_wrapper.dart";
import "../../../../test_util/testing_mocks.dart";

void main() {
  setUpAll(() {
    registerFallbackValue(FakeBuildContext());
  });

  group("Home Screen", () {
    testWidgets("shows home screen text", (tester) async {
      await tester.pumpWidget(TestWrapper(child: const HomeScreen()));
      await tester.pumpAndSettle();
      expect(find.text("Home"), findsOneWidget);
    });

    group("user flows", () {
      testWidgets("navigates to settings", (tester) async {
        final router = MockRouter();
        locator.registerSingleton<J1Router>(router);

        when(() => router.navigate(any(), any())).thenAnswer((_) => Future.value());

        await tester.pumpWidget(TestWrapper(child: const HomeScreen()));
        await tester.tap(find.byIcon(JamIcons.settings));
        await tester.pumpAndSettle();

        verify(() => router.navigate(any(), AromaRoute.settings.build(const EmptyRouteConfig()))).called(1);

        await locator.reset();
      });
    });
  });
}
