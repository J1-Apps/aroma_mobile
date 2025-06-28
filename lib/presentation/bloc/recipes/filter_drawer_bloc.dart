import "package:aroma_mobile/domain/usecase/tag/tags_usecase.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/filter_drawer_state.dart";
import "package:bloc_event_transformers/bloc_event_transformers.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

const _debounceDuration = Duration(milliseconds: 250);

class FilterDrawerBloc extends Bloc<FilterDrawerEvent, FilterDrawerState> {
  final TagsUsecase _tagsUsecase;

  FilterDrawerBloc({TagsUsecase? tagsUsecase})
    : _tagsUsecase = tagsUsecase ?? locator.get<TagsUsecase>(),
      super(FilterDrawerState.initial()) {
    on<FilterDrawerEventTagQueryChanged>(_onTagQueryChanged, transformer: debounce(_debounceDuration));
  }

  Future<void> _onTagQueryChanged(FilterDrawerEventTagQueryChanged event, Emitter<FilterDrawerState> emit) async {
    emit(state.copyWith(tagStatus: TagStatus.loading, tagResults: []));
    final tags = await _tagsUsecase(query: event.tagQuery);
    emit(state.copyWith(tagStatus: tags.isEmpty ? TagStatus.empty : TagStatus.success, tagResults: tags));
  }
}
