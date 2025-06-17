import "package:aroma_mobile/presentation/widget/screen/home/home_navigation.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../test_util/test_wrapper.dart";
import "../../../../test_util/testing_mocks.dart";

void main() {
  group("Home Navigation", () {
    testWidgets("displays a navigation bar, and calls the correct shell callbacks", (tester) async {
      final updateIndex = MockCallback<int>();

      await tester.pumpWidget(
        TestWrapper(
          child: HomeNavigation(
            currentIndex: 0,
            updateIndex: updateIndex.call,
            body: const Center(child: Text("Body")),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Body"), findsOneWidget);
      expect(find.byIcon(JamIcons.unordered_list), findsOneWidget);
      expect(find.byIcon(JamIcons.book), findsOneWidget);
      expect(find.byIcon(JamIcons.user_circle), findsOneWidget);

      await tester.tap(find.byIcon(JamIcons.unordered_list));
      await tester.pumpAndSettle();
      verify(() => updateIndex(0)).called(1);

      await tester.tap(find.byIcon(JamIcons.book));
      await tester.pumpAndSettle();
      verify(() => updateIndex(1)).called(1);

      await tester.tap(find.byIcon(JamIcons.user_circle));
      await tester.pumpAndSettle();
      verify(() => updateIndex(2)).called(1);
    });
  });
}
