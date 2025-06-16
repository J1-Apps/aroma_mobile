import "package:dart_mappable/dart_mappable.dart";

part "filter_entity.mapper.dart";

@MappableClass()
class FilterEntity with FilterEntityMappable {
  final int? timeMin;
  final int? timeMax;
  final int? ratingMin;
  final int? ratingMax;
  final int? difficultyMin;
  final int? difficultyMax;
  final List<int> tags;

  const FilterEntity({
    required this.timeMin,
    required this.timeMax,
    required this.ratingMin,
    required this.ratingMax,
    required this.difficultyMin,
    required this.difficultyMax,
    required this.tags,
  });

  factory FilterEntity.initial() => const FilterEntity(
    timeMin: null,
    timeMax: null,
    ratingMin: null,
    ratingMax: null,
    difficultyMin: null,
    difficultyMax: null,
    tags: [],
  );
}
