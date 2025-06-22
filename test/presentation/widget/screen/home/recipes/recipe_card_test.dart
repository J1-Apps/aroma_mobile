import "package:aroma_mobile/presentation/details/recipe_card_details.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipe_card.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";
import "package:mocktail_image_network/mocktail_image_network.dart";

import "../../../../../test_util/test_wrapper.dart";
import "../../../../../test_util/testing_mocks.dart";

void main() {
  group("Recipe Card", () {
    testWidgets("shows recipe card unselected", (tester) async {
      final onPressed = MockVoidCallback();
      final onLongPressed = MockVoidCallback();

      await mockNetworkImages(
        () async => tester.pumpWidget(
          TestWrapper(
            child: RecipeCard(
              recipe: RecipeCardDetails(
                id: "1",
                title: "Recipe 1",
                imageUrl: "https://example.com/image.jpg",
                totalTime: 10,
                servings: 1,
              ),
              isSelected: false,
              onPressed: onPressed.call,
              onLongPressed: onLongPressed.call,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(JCard));
      await tester.longPress(find.byType(JCard));

      expect(find.text("Recipe 1"), findsOneWidget);
      expect(find.text("10m"), findsOneWidget);
      expect(find.text("1"), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(2));

      verify(onPressed.call).called(1);
      verify(onLongPressed.call).called(1);
    });

    testWidgets("shows recipe card selected", (tester) async {
      final onPressed = MockVoidCallback();
      final onLongPressed = MockVoidCallback();

      await mockNetworkImages(
        () async => tester.pumpWidget(
          TestWrapper(
            child: RecipeCard(
              recipe: RecipeCardDetails(
                id: "2",
                title: "Recipe 2",
                imageUrl: "https://example.com/image.jpg",
                totalTime: 150,
                servings: 5,
              ),
              isSelected: true,
              onPressed: onPressed.call,
              onLongPressed: onLongPressed.call,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(JCard));
      await tester.longPress(find.byType(JCard));

      expect(find.text("Recipe 2"), findsOneWidget);
      expect(find.text("2h 30m"), findsOneWidget);
      expect(find.text("5"), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(2));

      verify(onPressed.call).called(1);
      verify(onLongPressed.call).called(1);
    });
  });
}
