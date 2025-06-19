import "package:dart_mappable/dart_mappable.dart";

part "filter_drawer_event.mapper.dart";

@MappableClass(discriminatorKey: "event")
sealed class FilterDrawerEvent with FilterDrawerEventMappable {
  const FilterDrawerEvent();
}

@MappableClass(discriminatorValue: "tagQueryChanged")
class FilterDrawerEventTagQueryChanged extends FilterDrawerEvent with FilterDrawerEventTagQueryChangedMappable {
  final String tagQuery;

  const FilterDrawerEventTagQueryChanged({required this.tagQuery});
}
