import "package:dart_mappable/dart_mappable.dart";

part "recipe_model.mapper.dart";

@MappableClass()
class RecipeModel with RecipeModelMappable {
  final String id;
  final String title;
  final String descriptionRaw;
  final String descriptionJson;
  final String ingredientsRaw;
  final String ingredientsJson;
  final String instructionsRaw;
  final String instructionsJson;
  final int prepTime;
  final int cookTime;
  final int servings;
  final String imageUrl;
  final int rating;
  final int difficulty;
  final String sourceName;
  final String sourceUrl;
  final String notesRaw;
  final String notesJson;

  const RecipeModel({
    required this.id,
    required this.title,
    required this.descriptionRaw,
    required this.descriptionJson,
    required this.ingredientsRaw,
    required this.ingredientsJson,
    required this.instructionsRaw,
    required this.instructionsJson,
    required this.prepTime,
    required this.cookTime,
    required this.servings,
    required this.imageUrl,
    required this.rating,
    required this.difficulty,
    required this.sourceName,
    required this.sourceUrl,
    required this.notesRaw,
    required this.notesJson,
  });
}
