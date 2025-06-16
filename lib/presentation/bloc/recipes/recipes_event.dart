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

class RecipesEventSort extends RecipesEvent {
  final SortEntity sort;

  const RecipesEventSort({required this.sort});
}
