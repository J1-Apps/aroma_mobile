import "package:dart_mappable/dart_mappable.dart";

part "recipe_entity.mapper.dart";

// TODO: Add delta fields.
@MappableClass()
class RecipeEntity with RecipeEntityMappable {
  final String id;
  final String title;
  // final Delta description;
  // final Delta ingredients;
  // final Delta instructions;
  final int prepTime;
  final int cookTime;
  final int servings;
  final String imageUrl;
  final int rating;
  final int difficulty;
  final String sourceName;
  final String sourceUrl;
  // final Delta notes;

  const RecipeEntity({
    required this.id,
    required this.title,
    required this.prepTime,
    required this.cookTime,
    required this.servings,
    required this.imageUrl,
    required this.rating,
    required this.difficulty,
    required this.sourceName,
    required this.sourceUrl,
  });
}
