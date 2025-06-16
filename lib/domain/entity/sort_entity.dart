import "package:dart_mappable/dart_mappable.dart";

part "sort_entity.mapper.dart";

@MappableEnum()
enum SortEntity {
  recentlyViewed,
  rating,
  quickest,
  easiest,
}
