import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";

sealed class RecipesEvent {
  const RecipesEvent();
}

class RecipesEventLoad extends RecipesEvent {
  const RecipesEventLoad();
}

class RecipesEventSearch extends RecipesEvent {
  final String searchQuery;

  const RecipesEventSearch({required this.searchQuery});
}

class RecipesEventFilter extends RecipesEvent {
  final SortEntity sort;
  final FilterEntity filter;

  const RecipesEventFilter({required this.sort, required this.filter});
}
