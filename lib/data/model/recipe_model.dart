import "package:aroma_mobile/data/model/tag_model.dart";
import "package:dart_mappable/dart_mappable.dart";

part "recipe_model.mapper.dart";

@MappableClass()
class RecipeModel with RecipeModelMappable {
  final String id;
  final String title;
  final String imageUrl;
  final int rating;
  final int prepTime;
  final int cookTime;
  final int servings;
  final int difficulty;
  final List<TagModel> tags;
  final String ingredientsRaw;
  final String ingredientsJson;
  final String directionsRaw;
  final String directionsJson;
  final String descriptionRaw;
  final String descriptionJson;
  final String notesRaw;
  final String notesJson;
  final String nutritionRaw;
  final String nutritionJson;
  final String sourceName;
  final String sourceUrl;

  const RecipeModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.prepTime,
    required this.cookTime,
    required this.servings,
    required this.difficulty,
    required this.tags,
    required this.ingredientsRaw,
    required this.ingredientsJson,
    required this.directionsRaw,
    required this.directionsJson,
    required this.descriptionRaw,
    required this.descriptionJson,
    required this.notesRaw,
    required this.notesJson,
    required this.nutritionRaw,
    required this.nutritionJson,
    required this.sourceName,
    required this.sourceUrl,
  });
}
