import "package:dart_mappable/dart_mappable.dart";

part "sort_entity.mapper.dart";

@MappableEnum()
enum SortEntity {
  none,
  recentlyViewed,
  rating,
  quickest,
  easiest,
  alphabetical,
}
