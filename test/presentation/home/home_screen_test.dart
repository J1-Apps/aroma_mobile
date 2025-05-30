import "package:aroma_mobile/presentation/screen/home/home_screen.dart";
import "package:flutter_test/flutter_test.dart";

import "../../test_util/test_wrapper.dart";

void main() {
  group("Home Screen", () {
    testWidgets("shows home screen text", (tester) async {
      await tester.pumpWidget(TestWrapper(child: const HomeScreen()));
      await tester.pumpAndSettle();
      expect(find.text("Home"), findsOneWidget);
    });
  });
}
