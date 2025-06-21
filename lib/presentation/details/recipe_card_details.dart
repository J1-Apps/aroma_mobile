import "package:aroma_mobile/domain/entity/recipe_entity.dart";
import "package:dart_mappable/dart_mappable.dart";

part "recipe_card_details.mapper.dart";

@MappableClass()
class RecipeCardDetails with RecipeCardDetailsMappable {
  final String id;
  final String title;
  final String imageUrl;
  final int totalTime;
  final int servings;

  const RecipeCardDetails({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.totalTime,
    required this.servings,
  });

  factory RecipeCardDetails.fromEntity(RecipeEntity recipe) {
    return RecipeCardDetails(
      id: recipe.id,
      title: recipe.title,
      imageUrl: recipe.imageUrl,
      totalTime: recipe.prepTime + recipe.cookTime,
      servings: recipe.servings,
    );
  }
}
