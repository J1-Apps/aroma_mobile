import "package:aroma_mobile/presentation/widget/screen/home/profile/profile_screen.dart";
import "package:flutter_test/flutter_test.dart";

import "../../../../../test_util/test_wrapper.dart";

void main() {
  group("Profile Screen", () {
    testWidgets("shows profile screen text", (tester) async {
      await tester.pumpWidget(TestWrapper(child: const ProfileScreen()));
      await tester.pumpAndSettle();
      expect(find.text("Profile"), findsOneWidget);
    });
  });
}
