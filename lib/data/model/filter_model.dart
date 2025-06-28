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

  bool get isEmpty =>
      ratingMin == null &&
      timeMin == null &&
      timeMax == null &&
      servingsMin == null &&
      servingsMax == null &&
      difficulties.isEmpty &&
      tags.isEmpty;

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
