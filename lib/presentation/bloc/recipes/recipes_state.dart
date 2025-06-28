import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/presentation/details/recipe_card_details.dart";
import "package:dart_mappable/dart_mappable.dart";

part "recipes_state.mapper.dart";

@MappableClass()
class RecipesState with RecipesStateMappable {
  final RecipesStatus status;
  final String searchQuery;
  final SortEntity sort;
  final FilterEntity filter;
  final List<RecipeCardDetails> recipes;
  final Set<String> selectedIds;
  final bool isDeleting;
  final ErrorCode? error;

  const RecipesState({
    required this.status,
    required this.searchQuery,
    required this.sort,
    required this.filter,
    required this.recipes,
    required this.selectedIds,
    required this.isDeleting,
    required this.error,
  });

  factory RecipesState.initial() => RecipesState(
    status: RecipesStatus.loading,
    searchQuery: "",
    sort: SortEntity.none,
    filter: FilterEntity(),
    recipes: const [],
    selectedIds: const {},
    isDeleting: false,
    error: null,
  );
}

@MappableEnum()
enum RecipesStatus {
  loading,
  error,
  empty,
  success,
}
