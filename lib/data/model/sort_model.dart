import "package:dart_mappable/dart_mappable.dart";

part "sort_model.mapper.dart";

@MappableEnum()
enum SortModel {
  none,
  recentlyViewed,
  rating,
  quickest,
  easiest,
  alphabetical,
}
