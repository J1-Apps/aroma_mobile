import "package:aroma_mobile/presentation/screen/login/reset_password_screen.dart";
import "package:flutter_test/flutter_test.dart";

import "../../../test_util/test_wrapper.dart";

void main() {
  group("Reset Password Screen", () {
    testWidgets("shows reset password screen", (tester) async {
      await tester.pumpWidget(
        TestWrapper(
          child: const ResetPasswordScreen(),
        ),
      );
      await tester.pumpAndSettle();
    });
  });
}
