import "package:aroma_mobile/presentation/screen/login/sign_in_screen.dart";
import "package:flutter_test/flutter_test.dart";

import "../../../test_util/test_wrapper.dart";

void main() {
  group("Sign In Screen", () {
    testWidgets("shows sign in screen", (tester) async {
      await tester.pumpWidget(
        TestWrapper(
          child: const SignInScreen(),
        ),
      );
      await tester.pumpAndSettle();
    });
  });
}
