import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";

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

@MappableClass(discriminatorValue: "filter")
class RecipesEventFilter extends RecipesEvent with RecipesEventFilterMappable {
  final SortEntity sort;
  final FilterEntity filter;

  const RecipesEventFilter({required this.sort, required this.filter});
}
