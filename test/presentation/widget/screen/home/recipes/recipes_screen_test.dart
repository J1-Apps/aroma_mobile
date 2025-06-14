import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_screen.dart";
import "package:flutter_test/flutter_test.dart";

import "../../../../../test_util/test_wrapper.dart";

void main() {
  group("Recipes Screen", () {
    testWidgets("shows recipes screen text", (tester) async {
      await tester.pumpWidget(TestWrapper(child: const RecipesScreen()));
      await tester.pumpAndSettle();
      expect(find.text("Recipes"), findsOneWidget);
    });
  });
}
