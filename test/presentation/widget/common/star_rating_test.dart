import "package:aroma_mobile/presentation/widget/common/star_rating.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_ui/icons/jam_icons.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/test_wrapper.dart";
import "../../../test_util/testing_mocks.dart";

void main() {
  group("Star Rating", () {
    testWidgets("renders ratings correctly and handles rating changes", (tester) async {
      final onRatingChanged = MockCallback<int>();

      await tester.pumpWidget(
        TestWrapper(
          child: StarRating(
            rating: 5,
            onRatingChanged: onRatingChanged.call,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(JamIcons.star_full), findsNWidgets(2));
      expect(find.byIcon(JamIcons.star_half), findsNWidgets(1));
      expect(find.byIcon(JamIcons.star), findsNWidgets(2));

      await tester.tap(find.byIcon(JamIcons.star).first);
      verify(() => onRatingChanged(8)).called(1);

      await tester.longPress(find.byIcon(JamIcons.star).first);
      verify(() => onRatingChanged(7)).called(1);
    });
  });
}
