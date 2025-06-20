import "package:dart_mappable/dart_mappable.dart";

part "filter_model.mapper.dart";

@MappableClass()
class FilterModel with FilterModelMappable {
  final int? ratingMin;
  final int? timeMin;
  final int? timeMax;
  final int? servingsMin;
  final int? servingsMax;
  final Set<int> difficulties;
  final Set<int> tags;

  const FilterModel({
    this.ratingMin,
    this.timeMin,
    this.timeMax,
    this.servingsMin,
    this.servingsMax,
    this.difficulties = const {},
    this.tags = const {},
  });
}
