import "package:aroma_mobile/data/model/sort_model.dart";
import "package:dart_mappable/dart_mappable.dart";

part "sort_entity.mapper.dart";

@MappableEnum()
enum SortEntity {
  none,
  recentlyViewed,
  rating,
  quickest,
  easiest,
  alphabetical;

  SortModel toModel() {
    switch (this) {
      case SortEntity.none:
        return SortModel.none;
      case SortEntity.recentlyViewed:
        return SortModel.recentlyViewed;
      case SortEntity.rating:
        return SortModel.rating;
      case SortEntity.quickest:
        return SortModel.quickest;
      case SortEntity.easiest:
        return SortModel.easiest;
      case SortEntity.alphabetical:
        return SortModel.alphabetical;
    }
  }
}
