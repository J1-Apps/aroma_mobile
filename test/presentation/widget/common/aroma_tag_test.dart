import "package:aroma_mobile/presentation/widget/common/aroma_tag.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/test_wrapper.dart";
import "../../../test_util/testing_mocks.dart";

void main() {
  group("Aroma Tag", () {
    testWidgets("shows and handles taps", (tester) async {
      final onPressed = MockVoidCallback();
      final onClosed = MockVoidCallback();

      await tester.pumpWidget(
        TestWrapper(
          child: Column(
            children: [
              AromaTag(text: "test", onPressed: onPressed.call),
              AromaTag(text: "test", onPressed: onClosed.call, showClose: true),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text("test").first);
      verify(onPressed.call).called(1);

      await tester.tap(find.byIcon(JamIcons.close));
      verify(onClosed.call).called(1);
    });
  });
}
