import "package:aroma_mobile/presentation/screen/login/register_screen.dart";
import "package:flutter_test/flutter_test.dart";

import "../../../test_util/test_wrapper.dart";

void main() {
  group("Register Screen", () {
    testWidgets("shows register screen", (tester) async {
      await tester.pumpWidget(
        TestWrapper(
          child: const RegisterScreen(),
        ),
      );
      await tester.pumpAndSettle();
    });
  });
}
