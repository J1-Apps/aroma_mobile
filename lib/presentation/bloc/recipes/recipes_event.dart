import "package:aroma_mobile/domain/entity/difficulty_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/domain/entity/tag_entity.dart";

import "package:dart_mappable/dart_mappable.dart";

part "recipes_event.mapper.dart";

@MappableClass(discriminatorKey: "event")
sealed class RecipesEvent with RecipesEventMappable {
  const RecipesEvent();
}

@MappableClass(discriminatorValue: "load")
class RecipesEventLoad extends RecipesEvent with RecipesEventLoadMappable {
  const RecipesEventLoad();
}

@MappableClass(discriminatorValue: "search")
class RecipesEventSearch extends RecipesEvent with RecipesEventSearchMappable {
  final String searchQuery;

  const RecipesEventSearch({required this.searchQuery});
}

@MappableClass(discriminatorValue: "reset_filter")
class RecipesEventResetFilter extends RecipesEvent with RecipesEventResetFilterMappable {
  const RecipesEventResetFilter();
}

@MappableClass(discriminatorValue: "update_sort")
class RecipesEventUpdateSort extends RecipesEvent with RecipesEventUpdateSortMappable {
  final SortEntity sort;

  const RecipesEventUpdateSort({required this.sort});
}

@MappableClass(discriminatorValue: "update_rating_min")
class RecipesEventUpdateRatingMin extends RecipesEvent with RecipesEventUpdateRatingMinMappable {
  final int? ratingMin;

  const RecipesEventUpdateRatingMin({required this.ratingMin});
}

@MappableClass(discriminatorValue: "update_time")
class RecipesEventUpdateTime extends RecipesEvent with RecipesEventUpdateTimeMappable {
  final int? timeMin;
  final int? timeMax;

  const RecipesEventUpdateTime({required this.timeMin, required this.timeMax});
}

@MappableClass(discriminatorValue: "update_servings")
class RecipesEventUpdateServings extends RecipesEvent with RecipesEventUpdateServingsMappable {
  final int? servingsMin;
  final int? servingsMax;

  const RecipesEventUpdateServings({required this.servingsMin, required this.servingsMax});
}

@MappableClass(discriminatorValue: "update_difficulty")
class RecipesEventUpdateDifficulty extends RecipesEvent with RecipesEventUpdateDifficultyMappable {
  final Set<DifficultyEntity> difficulties;

  const RecipesEventUpdateDifficulty({required this.difficulties});
}

@MappableClass(discriminatorValue: "update_tags")
class RecipesEventUpdateTags extends RecipesEvent with RecipesEventUpdateTagsMappable {
  final Set<TagEntity> tags;

  const RecipesEventUpdateTags({required this.tags});
}

@MappableClass(discriminatorValue: "toggle_selected")
class RecipesEventToggleSelected extends RecipesEvent with RecipesEventToggleSelectedMappable {
  final String recipeId;

  const RecipesEventToggleSelected({required this.recipeId});
}
