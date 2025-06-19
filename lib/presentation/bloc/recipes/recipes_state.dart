import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:dart_mappable/dart_mappable.dart";

part "recipes_state.mapper.dart";

@MappableClass()
class RecipesState with RecipesStateMappable {
  final RecipesStatus status;
  final String searchQuery;
  final SortEntity sort;
  final FilterEntity filter;

  const RecipesState({
    required this.status,
    required this.searchQuery,
    required this.sort,
    required this.filter,
  });

  factory RecipesState.initial() => RecipesState(
    status: RecipesStatus.loading,
    searchQuery: "",
    sort: SortEntity.none,
    filter: FilterEntity(),
  );
}

@MappableEnum()
enum RecipesStatus {
  loading,
  error,
  empty,
  success,
}
