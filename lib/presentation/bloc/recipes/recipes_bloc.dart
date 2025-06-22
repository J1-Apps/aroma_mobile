import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/domain/usecase/recipe/recipes_usecase.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/details/recipe_card_details.dart";
import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipesUsecase _recipesUsecase;

  RecipesBloc({RecipesUsecase? recipesUsecase})
    : _recipesUsecase = recipesUsecase ?? locator.get<RecipesUsecase>(),
      super(RecipesState.initial()) {
    on<RecipesEventLoad>(_onLoad, transformer: restartable());
    on<RecipesEventSearch>(_onSearch);
    on<RecipesEventResetFilter>(_onResetFilter);
    on<RecipesEventUpdateSort>(_onUpdateSort);
    on<RecipesEventUpdateRatingMin>(_onUpdateRatingMin);
    on<RecipesEventUpdateTime>(_onUpdateTime);
    on<RecipesEventUpdateServings>(_onUpdateServings);
    on<RecipesEventUpdateDifficulty>(_onUpdateDifficulty);
    on<RecipesEventUpdateTags>(_onUpdateTags);
    on<RecipesEventToggleSelected>(_onToggleSelected);
  }

  Future<void> _onLoad(RecipesEventLoad event, Emitter<RecipesState> emit) async {
    emit(state.copyWith(status: RecipesStatus.loading));

    final result = await _recipesUsecase(state.searchQuery, state.sort, state.filter);

    switch (result) {
      case Success():
        if (result.value.isEmpty) {
          emit(state.copyWith(status: RecipesStatus.empty, recipes: const [], selectedIds: const {}));
        } else {
          emit(
            state.copyWith(
              status: RecipesStatus.success,
              recipes: result.value.map(RecipeCardDetails.fromEntity).toList(),
              selectedIds: state.selectedIds.intersection(result.value.map((e) => e.id).toSet()),
            ),
          );
        }
      case Failure():
        emit(state.copyWith(status: RecipesStatus.error, selectedIds: const {}));
    }
  }

  Future<void> _onSearch(RecipesEventSearch event, Emitter<RecipesState> emit) async {
    if (event.searchQuery == state.searchQuery) {
      return;
    }

    emit(state.copyWith(searchQuery: event.searchQuery));
    add(const RecipesEventLoad());
  }

  Future<void> _onResetFilter(RecipesEventResetFilter event, Emitter<RecipesState> emit) async {
    emit(state.copyWith(sort: SortEntity.none, filter: FilterEntity()));
  }

  Future<void> _onUpdateSort(RecipesEventUpdateSort event, Emitter<RecipesState> emit) async {
    emit(state.copyWith(sort: event.sort));
  }

  Future<void> _onUpdateRatingMin(RecipesEventUpdateRatingMin event, Emitter<RecipesState> emit) async {
    emit(state.copyWith(filter: state.filter.copyWith(ratingMin: event.ratingMin)));
  }

  Future<void> _onUpdateTime(RecipesEventUpdateTime event, Emitter<RecipesState> emit) async {
    emit(
      state.copyWith(
        filter: state.filter.copyWith(
          timeMin: event.timeMin,
          timeMax: event.timeMax,
        ),
      ),
    );
  }

  Future<void> _onUpdateServings(RecipesEventUpdateServings event, Emitter<RecipesState> emit) async {
    emit(
      state.copyWith(
        filter: state.filter.copyWith(
          servingsMin: event.servingsMin,
          servingsMax: event.servingsMax,
        ),
      ),
    );
  }

  Future<void> _onUpdateDifficulty(RecipesEventUpdateDifficulty event, Emitter<RecipesState> emit) async {
    emit(state.copyWith(filter: state.filter.copyWith(difficulties: event.difficulties)));
  }

  Future<void> _onUpdateTags(RecipesEventUpdateTags event, Emitter<RecipesState> emit) async {
    emit(state.copyWith(filter: state.filter.copyWith(tags: event.tags)));
  }

  Future<void> _onToggleSelected(RecipesEventToggleSelected event, Emitter<RecipesState> emit) async {
    emit(
      state.copyWith(
        selectedIds: state.selectedIds.contains(event.recipeId)
            ? state.selectedIds.difference({event.recipeId})
            : state.selectedIds.union({event.recipeId}),
      ),
    );
  }
}
