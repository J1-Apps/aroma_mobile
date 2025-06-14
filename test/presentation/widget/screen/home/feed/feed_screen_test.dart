import "package:aroma_mobile/presentation/widget/screen/home/feed/feed_screen.dart";
import "package:flutter_test/flutter_test.dart";

import "../../../../../test_util/test_wrapper.dart";

void main() {
  group("Feed Screen", () {
    testWidgets("shows feed screen text", (tester) async {
      await tester.pumpWidget(TestWrapper(child: const FeedScreen()));
      await tester.pumpAndSettle();
      expect(find.text("Feed"), findsOneWidget);
    });
  });
}
