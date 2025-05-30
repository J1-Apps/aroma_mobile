import "package:aroma_mobile/presentation/screen/login/login_screen.dart";
import "package:flutter_test/flutter_test.dart";

import "../../test_util/test_wrapper.dart";

void main() {
  group("Login Screen", () {
    testWidgets("shows login screen text", (tester) async {
      await tester.pumpWidget(TestWrapper(child: const LoginScreen()));
      await tester.pumpAndSettle();
      expect(find.text("Login"), findsOneWidget);
    });
  });
}
