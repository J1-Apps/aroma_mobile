import "package:aroma_mobile/domain/entity/filter_entity.dart";
import "package:aroma_mobile/domain/entity/sort_entity.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  RecipesBloc() : super(RecipesState.initial()) {
    on<RecipesEventLoad>(_onLoad, transformer: restartable());
    on<RecipesEventSearch>(_onSearch);
    on<RecipesEventResetFilter>(_onResetFilter);
    on<RecipesEventUpdateSort>(_onUpdateSort);
    on<RecipesEventUpdateRatingMin>(_onUpdateRatingMin);
    on<RecipesEventUpdateTime>(_onUpdateTime);
    on<RecipesEventUpdateServings>(_onUpdateServings);
    on<RecipesEventUpdateDifficulty>(_onUpdateDifficulty);
    on<RecipesEventUpdateTags>(_onUpdateTags);
  }

  Future<void> _onLoad(RecipesEventLoad event, Emitter<RecipesState> emit) async {
    emit(state.copyWith(status: RecipesStatus.loading));

    // TODO: Load recipes from use case.
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: RecipesStatus.success));
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
}
