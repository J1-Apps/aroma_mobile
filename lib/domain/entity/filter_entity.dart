import "package:aroma_mobile/data/model/filter_model.dart";
import "package:aroma_mobile/domain/entity/difficulty_entity.dart";
import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:dart_mappable/dart_mappable.dart";

part "filter_entity.mapper.dart";

@MappableClass()
class FilterEntity with FilterEntityMappable {
  final int? ratingMin;
  final int? timeMin;
  final int? timeMax;
  final int? servingsMin;
  final int? servingsMax;
  final Set<DifficultyEntity> difficulties;
  final Set<TagEntity> tags;

  const FilterEntity({
    this.ratingMin,
    this.timeMin,
    this.timeMax,
    this.servingsMin,
    this.servingsMax,
    this.difficulties = const {},
    this.tags = const {},
  });

  FilterModel toModel() {
    return FilterModel(
      ratingMin: ratingMin,
      timeMin: timeMin,
      timeMax: timeMax,
      servingsMin: servingsMin,
      servingsMax: servingsMax,
      difficulties: difficulties.map((e) => e.toModel()).toSet(),
      tags: tags.map((e) => e.toModel()).toSet(),
    );
  }
}
