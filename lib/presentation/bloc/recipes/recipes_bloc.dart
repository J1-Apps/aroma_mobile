import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  RecipesBloc() : super(const RecipesState(status: RecipesStatus.loading, searchQuery: "")) {
    on<RecipesEventLoad>(_onLoad, transformer: restartable());
    on<RecipesEventSearch>(_onSearch);
  }

  Future<void> _onLoad(RecipesEventLoad event, Emitter<RecipesState> emit) async {
    emit(state.copyWith(status: RecipesStatus.loading));

    // TODO: Load recipes from use case.
    await Future.delayed(const Duration(seconds: 5));

    emit(state.copyWith(status: RecipesStatus.success));
  }

  Future<void> _onSearch(RecipesEventSearch event, Emitter<RecipesState> emit) async {
    emit(state.copyWith(searchQuery: event.searchQuery));
    add(const RecipesEventLoad());
  }
}
