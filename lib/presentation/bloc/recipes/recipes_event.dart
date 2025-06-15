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
