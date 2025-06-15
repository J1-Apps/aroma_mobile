import "package:dart_mappable/dart_mappable.dart";

part "recipes_state.mapper.dart";

@MappableClass()
class RecipesState with RecipesStateMappable {
  final RecipesStatus status;
  final String searchQuery;
  // TODO: Add filters.

  const RecipesState({
    required this.status,
    required this.searchQuery,
  });
}

@MappableEnum()
enum RecipesStatus {
  loading,
  error,
  empty,
  success,
}
