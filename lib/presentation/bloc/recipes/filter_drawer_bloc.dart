import "package:aroma_mobile/domain/usecase/tag/tag_usecase.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_state.dart";
import "package:bloc_event_transformers/bloc_event_transformers.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

const _debounceDuration = Duration(milliseconds: 250);

class FilterDrawerBloc extends Bloc<FilterDrawerEvent, FilterDrawerState> {
  final TagUsecase _tagUsecase;

  FilterDrawerBloc({TagUsecase? tagUsecase})
    : _tagUsecase = tagUsecase ?? locator.get<TagUsecase>(),
      super(FilterDrawerState.initial()) {
    on<FilterDrawerTagQueryChanged>(_onTagQueryChanged, transformer: debounce(_debounceDuration));
  }

  Future<void> _onTagQueryChanged(FilterDrawerTagQueryChanged event, Emitter<FilterDrawerState> emit) async {
    emit(state.copyWith(tagStatus: TagStatus.loading, tagResults: []));
    final tags = await _tagUsecase(query: event.tagQuery);
    emit(state.copyWith(tagStatus: tags.isEmpty ? TagStatus.empty : TagStatus.success, tagResults: tags));
  }
}
