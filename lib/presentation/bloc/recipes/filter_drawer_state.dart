import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:dart_mappable/dart_mappable.dart";

part "filter_drawer_state.mapper.dart";

@MappableClass()
class FilterDrawerState with FilterDrawerStateMappable {
  final TagStatus tagStatus;
  final List<TagEntity> tagResults;

  const FilterDrawerState({
    required this.tagStatus,
    required this.tagResults,
  });

  factory FilterDrawerState.initial() => FilterDrawerState(
    tagStatus: TagStatus.empty,
    tagResults: [],
  );
}

@MappableEnum()
enum TagStatus {
  loading,
  empty,
  success,
}
